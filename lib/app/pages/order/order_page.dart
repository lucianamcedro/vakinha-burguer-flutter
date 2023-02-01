import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/core/base_state/base_state.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burguer_flutter/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer_flutter/app/models/payment_type_model.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_state.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/widgets/order_field.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/widgets/order_produt_tile.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/widgets/payment_types_field.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: hideLoader,
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? "Erro não informado!");
          },
        );
      },
      child: Scaffold(
          appBar: DeliveryAppbar(),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        'Carrinho',
                        style: context.textStyle.textTitle,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/trashRegular.png'),
                      ),
                    ],
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
                        final orderProduct = orderProducts[index];
                        return Column(
                          children: [
                            OrderProdutTile(
                              index: index,
                              orderProduct: orderProduct,
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
                          Text(
                            r'R$200,00',
                            style: context.textStyle.textExtraBold
                                .copyWith(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    OrderField(
                      titulo: 'Endereço de entrega',
                      controller: TextEditingController(),
                      validator: Validatorless.required("m"),
                      hintText: "Digite o endereço",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OrderField(
                      titulo: 'CPF',
                      controller: TextEditingController(),
                      validator: Validatorless.required("m"),
                      hintText: "Digite o CPF",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocSelector<OrderController, OrderState,
                        List<PaymentTypeModel>>(
                      selector: (state) => state.paymentType,
                      builder: (context, paymentType) {
                        return PaymentTypesField(
                          paymentTypes: paymentType,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
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
                        onPressed: () {},
                        width: double.infinity,
                        height: 48,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
