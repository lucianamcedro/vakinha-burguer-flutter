// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_increment.dart';

import 'package:vakinha_burguer_flutter/app/dto/order_product_dto.dart';

class OrderProdutTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProdutTile({
    Key? key,
    required this.index,
    required this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Image.network(
            orderProduct.productModel.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderProduct.productModel.name,
                    style: context.textStyle.textRegular.copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (orderProduct.amount * orderProduct.productModel.price)
                            .currencyPTBR,
                        style: context.textStyle.textMedium.copyWith(
                            fontSize: 14, color: context.colors.secondary),
                      ),
                      DeliveryIncrement.compact(
                        amount: 1,
                        incrementPress: () {},
                        decrementPress: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
