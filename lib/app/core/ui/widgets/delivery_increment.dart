import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';

class DeliveryIncrement extends StatelessWidget {
  const DeliveryIncrement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '-',
              style: context.textStyle.textMedium
                  .copyWith(fontSize: 22, color: Colors.grey),
            ),
          ),
          Text(
            '1',
            style: context.textStyle.textRegular
                .copyWith(fontSize: 17, color: context.colors.secondary),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '+',
              style: context.textStyle.textMedium
                  .copyWith(fontSize: 22, color: context.colors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
