import "package:flutter/material.dart";
import "./themes/themes.dart";
import "./app.dart";

void main(){
  runApp(Flowmodoro());
}

class Flowmodoro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
      theme: Themes.darkTheme,
    );
  }
}