import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/core/base_state/base_state.dart';
import 'package:vakinha_burguer_flutter/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burguer_flutter/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer_flutter/app/models/payment_type_model.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_state.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/widgets/order_field.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/widgets/order_produt_tile.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/widgets/payment_types_field.dart';
import 'package:validatorless/validatorless.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  final formKey = GlobalKey<FormState>();
  final addressEc = TextEditingController();
  final documentEc = TextEditingController();
  int? paymentTypeId;
  final paymentTypeValid = ValueNotifier(true);
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');

  @override
  void onReady() {
    super.onReady();
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    addressEc.dispose();
    documentEc.dispose();
    super.dispose();
  }

  void _showConfirmProductDialog(OrderConfirmDeleteProductState state) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
                'Deseja excluir o produto ${state.orderProduct.productModel.name}?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  controller.cancelDeleteProcess();
                },
                child: Text(
                  'Cancelar',
                  style: context.textStyle.textBold.copyWith(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.decrementProduct(state.index);
                },
                child: Text(
                  'Confirmar',
                  style: context.textStyle.textBold,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? "Erro não informado!");
          },
          confirmRemoveProduct: () {
            hideLoader();
            if (state is OrderConfirmDeleteProductState) {
              _showConfirmProductDialog(state);
            }
          },
          emptyBag: () {
            showInfo(
                'Sua sacola está vazia, por favor selecione um produto para realizar seu pedido');

            Navigator.of(context).pop(const <OrderProductDto>[]);
          },
          success: () {
            hideLoader();
            Navigator.of(context).popAndPushNamed('/order/completed',
                result: <OrderProductDto>[]);
          },
        );
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(controller.state.orderProducts);

          return false;
        },
        child: Scaffold(
            body: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Row(
                      children: [
                        Text(
                          'Carrinho',
                          style: context.textStyle.textTitle,
                        ),
                        IconButton(
                          onPressed: controller.emptyBag,
                          icon: Image.asset('assets/images/trashRegular.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
                selector: (state) => state.orderProducts,
                builder: (context, orderProducts) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: orderProducts.length,
                      (context, index) {
                        return Column(
                          children: [
                            OrderProdutTile(
                              index: index,
                              orderProduct: orderProducts[index],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total do pedido',
                            style: context.textStyle.textExtraBold
                                .copyWith(fontSize: 16),
                          ),
                          BlocSelector<OrderController, OrderState, double>(
                            selector: (state) => state.totalOrder,
                            builder: (context, totalOrder) {
                              return Text(
                                totalOrder.currencyPTBR,
                                style: context.textStyle.textExtraBold
                                    .copyWith(fontSize: 20),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    OrderField(
                      titulo: 'Endereço de entrega',
                      controller: addressEc,
                      validator: Validatorless.required("Endereço Obrigatório"),
                      hintText: "Digite o endereço",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OrderField(
                      titulo: 'CPF',
                      inputFormatters: [cpfMask],
                      controller: documentEc,
                      validator: Validatorless.required("CPF Obrigatório"),
                      hintText: "Digite o CPF",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocSelector<OrderController, OrderState,
                        List<PaymentTypeModel>>(
                      selector: (state) => state.paymentType,
                      builder: (context, paymentType) {
                        return ValueListenableBuilder(
                          valueListenable: paymentTypeValid,
                          builder: (_, paymentTypeValidValue, child) {
                            return PaymentTypesField(
                              valid: paymentTypeValidValue,
                              valueSelected: paymentTypeId.toString(),
                              paymentTypes: paymentType,
                              valueChanged: (int value) {
                                paymentTypeId = value;
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DeliveryButton(
                        label: "FINALIZAR",
                        onPressed: () {
                          final valid =
                              formKey.currentState?.validate() ?? false;
                          final paymentTyeSelected = paymentTypeId != null;
                          paymentTypeValid.value = paymentTyeSelected;
                          if (valid && paymentTyeSelected) {
                            controller.saveOrder(
                                address: addressEc.text,
                                document: documentEc.text,
                                paymentMethodId: paymentTypeId!);
                          }
                        },
                        width: double.infinity,
                        height: 48,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
