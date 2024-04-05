import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isSufix;
  TextInputType? number;
  final FormFieldValidator<String?>? validator;

  MyTextField({
    super.key,
    this.number,
    required this.isSufix,
    required this.validator,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 100),
      child: TextFormField(
        validator: validator,
        keyboardType: number ?? TextInputType.text,
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: isSufix
              ? const Icon(
                  Icons.visibility,
                  color: Colors.black,
                )
              : const SizedBox(),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 5, color: Colors.black)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
