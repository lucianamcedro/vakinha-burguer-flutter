import 'package:vakinha_burguer_flutter/app/models/auth_model.dart';

abstract class AuthRepository {
  Future<void> register(String name, String email, String password);

  Future<AuthModel> login(String email, String password);
}