import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

topSnackbar(BuildContext context, String message, Color color) {
  return Flushbar(
    message: message,
    icon: const Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.white,
    ),
    margin: const EdgeInsets.all(6.0),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: Colors.black,
    backgroundColor: color,
  ).show(context);
}
