import "package:flutter/material.dart";
import "../themes/themes.dart";

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  ButtonWidget({required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: TextButton(
        child: Text(text),
        onPressed: onClick,
        style: Themes.buttonStyle,
      ),
    );
  }
}
