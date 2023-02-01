import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/login/login_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/login/login_page.dart';

class LoginRoute {
  LoginRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => LoginController(
              context.read(),
            ),
          )
        ],
        child: const LoginPage(),
      );
}
