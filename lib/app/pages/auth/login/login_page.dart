import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: context.textStyle.textTitle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: DeliveryButton(
                        label: 'ENTRAR',
                        onPressed: () {},
                        height: 50,
                        width: double.infinity,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não possui uma conta',
                        style: context.textStyle.textBold,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: Text(
                            'Cadastra-se',
                            style: context.textStyle.textBold
                                .copyWith(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
