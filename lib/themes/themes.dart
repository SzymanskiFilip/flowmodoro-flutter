import 'package:flutter/material.dart';

class Themes{

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(

  );

  static final timerStyle = TextStyle(
    fontSize: 50,
  );

  static final buttonStyle = TextButton.styleFrom(
    backgroundColor: Colors.black,
    primary: Colors.white,
    padding: EdgeInsets.all(10.0),
  );


}