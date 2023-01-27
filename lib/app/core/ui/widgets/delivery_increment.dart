import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';

class DeliveryIncrement extends StatelessWidget {
  final int amount;
  final VoidCallback incrementPress;
  final VoidCallback decrementPress;
  const DeliveryIncrement(
      {super.key,
      required this.amount,
      required this.incrementPress,
      required this.decrementPress});

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
          InkWell(
            onTap: decrementPress,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '-',
                style: context.textStyle.textMedium
                    .copyWith(fontSize: 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyle.textRegular
                .copyWith(fontSize: 17, color: context.colors.secondary),
          ),
          InkWell(
            onTap: incrementPress,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '+',
                style: context.textStyle.textMedium
                    .copyWith(fontSize: 22, color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
