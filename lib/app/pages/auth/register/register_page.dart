import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textStyle.textTitle,
                ),
                Text(
                  'Preencha os campos abaixo para criar o seu cadastro.',
                  style: context.textStyle.textMedium.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirma Senha'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: DeliveryButton(
                    label: "Cadastrar",
                    onPressed: () {},
                    width: double.infinity,
                    height: 50,
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
