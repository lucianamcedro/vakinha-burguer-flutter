import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/dto/order_product_dto.dart';

import 'package:vakinha_burguer_flutter/app/models/product_model.dart';
import 'package:vakinha_burguer_flutter/app/pages/home/home_controller.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel productModel;
  final OrderProductDto? orderProductDto;

  const DeliveryProductTile({
    Key? key,
    required this.productModel,
    required this.orderProductDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProduct =
            await Navigator.of(context).pushNamed('/detail', arguments: {
          'product': productModel,
          'order': orderProductDto,
        });
        if (orderProduct != null) {
          controller.addOrUpdateBag(orderProduct as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: productModel.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      productModel.name,
                      style: context.textStyle.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      productModel.description,
                      style:
                          context.textStyle.textRegular.copyWith(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      productModel.price.currencyPTBR,
                      style: context.textStyle.textMedium.copyWith(
                        fontSize: 12,
                        color: context.colors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
