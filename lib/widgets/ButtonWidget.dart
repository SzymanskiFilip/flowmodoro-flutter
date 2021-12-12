import "package:flutter/material.dart";
import "../themes/themes.dart";

class ButtonWidget extends StatefulWidget {
  String text = "Start";
  VoidCallback onClick;
  bool running;

  ButtonWidget(
      {required this.text, required this.onClick, required this.running});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  void func() {
    widget.onClick();
    setState(() {
      widget.text = "Start";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: TextButton(
        child: Text(widget.text),
        onPressed: func,
        style: Themes.buttonStyle,
      ),
    );
  }
}
