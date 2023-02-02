// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/styles/text_styles.dart';

class OrderField extends StatelessWidget {
  final String titulo;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  const OrderField({
    Key? key,
    required this.titulo,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                titulo,
                style: context.textStyle.textRegular.copyWith(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              controller: controller,
              validator: validator,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: hintText,
                border: defaultBorder,
                enabledBorder: defaultBorder,
                focusedBorder: defaultBorder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
