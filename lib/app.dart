import 'package:flutter/material.dart';
import './widgets/TimerWidget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Flowmodoro Timer"),
        ),
      ),
      body: Center(
        child: TimerWidget(),
      ),
    );
  }
}
