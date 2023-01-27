import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/pages/detail/product_detail.dart';

class ProductRoute {
  ProductRoute._();

  static Widget get page => MultiProvider(providers: [
        Provider(
          create: (context) => Object(),
        )
      ], child: const ProductDetail());
}
