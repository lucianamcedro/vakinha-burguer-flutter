import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_page.dart';

class OrderRoute {
  OrderRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => OrderController(),
          )
        ],
        child: const OrderPage(),
      );
}
