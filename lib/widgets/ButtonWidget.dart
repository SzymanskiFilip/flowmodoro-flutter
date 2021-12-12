import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final String text;
  final VoidCallback onClick;

  ButtonWidget({required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(child: Text(text), onPressed: onClick);
  }
}
