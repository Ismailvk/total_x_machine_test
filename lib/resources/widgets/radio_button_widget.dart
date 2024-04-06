import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioButtonWidget extends StatelessWidget {
  ValueNotifier<int> optionValueNotifier;
  String title;
  int value;
  RadioButtonWidget(
      {super.key,
      required this.optionValueNotifier,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      leading: Radio<int>(
        value: value,
        groupValue: optionValueNotifier.value,
        activeColor: Colors.blue,
        fillColor: MaterialStateProperty.all(Colors.blue),
        splashRadius: 25,
        onChanged: (int? value) {
          optionValueNotifier.value = value!;
          optionValueNotifier.notifyListeners();
        },
      ),
    );
  }
}
