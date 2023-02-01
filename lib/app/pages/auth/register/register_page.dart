import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/core/base_state/base_state.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/register/register_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/auth/register/register_state.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final passwordConfirmationEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    passwordConfirmationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSucess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
          appBar: DeliveryAppbar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cadastro',
                        style: context.textStyle.textTitle,
                      ),
                      Text(
                        'Preencha os campos abaixo para criar o seu cadastro.',
                        style:
                            context.textStyle.textMedium.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: nameEC,
                        decoration: const InputDecoration(labelText: 'Nome'),
                        validator: Validatorless.required('Obrigatório'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailEC,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: Validatorless.multiple([
                          Validatorless.required('Obrigatório'),
                          Validatorless.email('E-mail inválido')
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordEC,
                        decoration: const InputDecoration(labelText: 'Senha'),
                        validator: Validatorless.multiple([
                          Validatorless.required('Obrigatório'),
                          Validatorless.min(
                              6, 'Senha deve conter no mínimo 6 caracteres')
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordConfirmationEC,
                        decoration:
                            const InputDecoration(labelText: 'Confirma Senha'),
                        validator: Validatorless.multiple([
                          Validatorless.required('Obrigatório'),
                          Validatorless.min(
                              6, 'Senha deve conter no mínimo 6 caracteres'),
                          Validatorless.compare(
                              passwordEC, 'As senhas não conferem')
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: DeliveryButton(
                          label: "Cadastrar",
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;

                            if (valid) {
                              controller.register(
                                  nameEC.text, emailEC.text, passwordEC.text);
                            }
                          },
                          width: double.infinity,
                          height: 50,
                        ),
                      )
                    ],
                  )),
            ),
          )),
    );
  }
}
