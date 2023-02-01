import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_page.dart';
import 'package:vakinha_burguer_flutter/app/repositories/order/order_repository.dart';
import 'package:vakinha_burguer_flutter/app/repositories/order/order_repository_impl.dart';

class OrderRoute {
  OrderRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(
            create: (context) => OrderRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => OrderController(context.read()),
          )
        ],
        child: const OrderPage(),
      );
}
