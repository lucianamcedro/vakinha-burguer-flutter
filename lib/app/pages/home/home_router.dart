import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/pages/home/home_page.dart';
import 'package:vakinha_burguer_flutter/app/repositories/products/products_repository.dart';
import 'package:vakinha_burguer_flutter/app/repositories/products/products_repository_impl.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
              dio: context.read(),
            ),
          ),
        ],
        child: const HomePage(),
      );
}