import 'dart:async';

import 'package:flowmodoro/widgets/ButtonWidget.dart';
import "package:flutter/material.dart";
import "../themes/themes.dart";

class BreakScreen extends StatefulWidget {
  const BreakScreen({Key? key}) : super(key: key);

  @override
  _BreakScreenState createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {
  Duration time = Duration(seconds: 5);
  final Duration second = Duration(seconds: 1);
  Timer? timer;
  bool running = true;

  @override
  void initState() {
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(second, (timer) {
      updateTime();
      if (time.inSeconds == 0) {
        running = false;
        timer.cancel();
      }
    });
  }

  void updateTime() {
    setState(() {
      int seconds = time.inSeconds - 1;
      time = Duration(seconds: seconds);
      print(time.inSeconds);
    });
  }

  void onBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(time.inMinutes.remainder(60));
    final seconds = twoDigits(time.inSeconds.remainder(60));

    return Scaffold(
      appBar: AppBar(
        title: Text("Break Phase"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$minutes:$seconds",
                style: Themes.timerStyle,
              ),
              if (!running)
                ButtonWidget(
                    text: "Come back", onClick: onBack, running: running)
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Add alarm on timer end, add a button to return back to timer
