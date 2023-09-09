import 'package:flutter/material.dart';

import '../coloors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      this.buttonWIdth,
      required this.onPressed,
      required this.text,
      required int buttonWidth})
      : super(key: key);
  final double? buttonWIdth;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWIdth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
