import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_button.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.percentHeight(.20),
            ),
            Image.asset('assets/images/logo_rounded.png'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Pedido realizado com sucesso, em breve você receberá a confirmação do seu pedido.',
              textAlign: TextAlign.center,
              style: context.textStyle.textExtraBold.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 40,
            ),
            DeliveryButton(
              width: context.percentWidth(.80),
              height: 50,
              label: 'FECHAR',
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    ));
  }
}
