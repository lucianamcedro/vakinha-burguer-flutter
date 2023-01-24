import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/config/env/env.dart';
import 'package:vakinha_burguer_flutter/app/dw9_delivery_app.dart';

void main() async {
  await Env.i.load();
  runApp(const Dw9DeliveryApp());
}
