import 'dart:async';

import "package:flutter/material.dart";
import "../themes/themes.dart";

class BreakScreen extends StatefulWidget {
  const BreakScreen({Key? key}) : super(key: key);

  @override
  _BreakScreenState createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {
  Duration time = Duration(minutes: 1, seconds: 1);
  final Duration second = Duration(seconds: 1);
  Timer? timer;

  @override
  void initState() {
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(second, (timer) {
      updateTime();
    });
  }

  void updateTime() {
    setState(() {
      int seconds = time.inSeconds - 1;
      time = Duration(seconds: seconds);
      print(time.inSeconds);
    });
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
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Add alarm on timer end, add a button to return back to timer
