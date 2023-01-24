import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/theme/theme_config.dart';
import 'package:vakinha_burguer_flutter/app/pages/splash/splash_page.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vakinha Burguer',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}