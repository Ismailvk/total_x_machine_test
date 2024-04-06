import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  TextInputType? number;
  final FormFieldValidator<String?>? validator;

  SearchTextField({
    super.key,
    this.number,
    required this.validator,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);

    return Container(
      constraints: const BoxConstraints(minHeight: 40, maxHeight: 53),
      child: TextFormField(
        validator: validator,
        keyboardType: number ?? TextInputType.text,
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(width: 5, color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
