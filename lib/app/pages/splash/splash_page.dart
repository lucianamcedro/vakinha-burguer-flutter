import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            label: 'Batata',
            onPressed: () {},
          ),
          TextFormField(),
        ],
      ),
    );
  }
}
