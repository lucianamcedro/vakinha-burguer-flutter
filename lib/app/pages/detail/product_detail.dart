import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/core/base_state/base_state.dart';
import 'package:vakinha_burguer_flutter/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_increment.dart';
import 'package:vakinha_burguer_flutter/app/models/product_model.dart';
import 'package:vakinha_burguer_flutter/app/pages/detail/product_controller.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetail({super.key, required this.productModel});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends BaseState<ProductDetail, ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidht,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                widget.productModel.image,
              ),
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.productModel.name,
              style: context.textStyle.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Text(
                  'Lanche gostosão, gostosin no azzeite, com cebola caremaelizada, bacon bem fritin, hamburger artesanal, queijo gorgonzola, no caprichoo chefe',
                  style: context.textStyle.textRegular.copyWith(fontSize: 15),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductController, int>(
                  builder: (context, amout) {
                    return DeliveryIncrement(
                      amout: amout,
                      decrementPress: () {
                        controller.decrement();
                      },
                      incrementPress: () {
                        controller.increment();
                      },
                    );
                  },
                ),
              ),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductController, int>(
                  builder: (context, amout) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Adicionar",
                            style: context.textStyle.textExtraBold
                                .copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              (widget.productModel.price * 1).currencyPTBR,
                              maxFontSize: 13,
                              minFontSize: 5,
                              maxLines: 1,
                              style: context.textStyle.textExtraBold,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.percentHeight(.02),
          ),
        ],
      ),
    );
  }
}
