import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';

class DeliveryIncrement extends StatelessWidget {
  final int amount;
  final VoidCallback incrementPress;
  final VoidCallback decrementPress;
  final bool _compact;

  const DeliveryIncrement(
      {super.key,
      required this.amount,
      required this.incrementPress,
      required this.decrementPress})
      : _compact = false;

  const DeliveryIncrement.compact(
      {super.key,
      required this.amount,
      required this.incrementPress,
      required this.decrementPress})
      : _compact = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(6) : null,
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
                    .copyWith(fontSize: _compact ? 10 : 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyle.textRegular.copyWith(
                fontSize: _compact ? 13 : 17, color: context.colors.secondary),
          ),
          InkWell(
            onTap: incrementPress,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '+',
                style: context.textStyle.textMedium.copyWith(
                    fontSize: _compact ? 10 : 22,
                    color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
