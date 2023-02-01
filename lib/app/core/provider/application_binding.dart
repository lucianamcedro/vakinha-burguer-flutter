import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_flutter/app/core/config/rest/custom_dio.dart';
import 'package:vakinha_burguer_flutter/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burguer_flutter/app/repositories/auth/auth_repository_impl.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider<AuthRepository>(
            create: (context) => AuthRepositoryImpl(
                  dio: context.read(),
                ))
      ],
      child: child,
    );
  }
}
