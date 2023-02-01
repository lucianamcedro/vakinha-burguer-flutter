import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/core/base_state/base_state.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/login/login_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/login/login_state.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          login: () => showLoader(),
          loginError: () {
            hideLoader();
            showError('Login ou senha inválidos!');
          },
          error: () {
            hideLoader();
            showError('Erro ao realizar login');
          },
          success: () {
            hideLoader();
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
          appBar: DeliveryAppbar(),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                      key: formKey,
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
                            controller: emailEC,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Obrigatório'),
                              Validatorless.email('E-mail Inválido'),
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordEC,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Obrigatório'),
                              Validatorless.min(
                                  6, 'Deve conter no mínimo 6 caracteres'),
                            ]),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: DeliveryButton(
                              label: 'ENTRAR',
                              onPressed: () {
                                final valid =
                                    formKey.currentState?.validate() ?? false;

                                if (valid) {
                                  controller.login(
                                      emailEC.text, passwordEC.text);
                                }
                              },
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
          )),
    );
  }
}
