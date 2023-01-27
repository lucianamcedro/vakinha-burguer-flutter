import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/pages/detail/product_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/detail/product_detail.dart';

class ProductRoute {
  ProductRoute._();

  static Widget get page => MultiProvider(
          providers: [
            Provider(
              create: (context) => ProductController(),
            )
          ],
          builder: (context, child) {
            final args = ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>;
            return ProductDetail(
              productModel: args['product'],
              order: args['order'],
            );
          });
}
