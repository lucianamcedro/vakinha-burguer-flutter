import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/provider/application_binding.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/global/global_context.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/theme/theme_config.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/login/login_route.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/register/register_route.dart';
import 'package:vakinha_burguer_flutter/app/pages/detail/product_route.dart';
import 'package:vakinha_burguer_flutter/app/pages/home/home_router.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_completed_page.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_route.dart';
import 'package:vakinha_burguer_flutter/app/pages/splash/splash_page.dart';

class Dw9DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  Dw9DeliveryApp({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Vakinha Burguer',
        debugShowCheckedModeBanner: false,
        navigatorKey: _navKey,
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/detail': (context) => ProductRoute.page,
          '/login': (context) => LoginRoute.page,
          '/register': (context) => RegisterRoute.page,
          '/order': (context) => OrderRoute.page,
          '/order/completed': (context) => const OrderCompletedPage()
        },
      ),
    );
  }
}
