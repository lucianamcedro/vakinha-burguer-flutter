import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/register/register_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/register/register_page.dart';

class RegisterRoute {
  RegisterRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => RegisterController(
              context.read(),
            ),
          )
        ],
        child: const RegisterPage(),
      );
}
