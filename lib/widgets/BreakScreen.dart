import 'dart:async';

import 'package:flowmodoro/widgets/ButtonWidget.dart';
import "package:flutter/material.dart";
import "../themes/themes.dart";

class BreakScreen extends StatefulWidget {
  final Duration toCountDown;


  BreakScreen(this.toCountDown);

  @override
  _BreakScreenState createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {
  Duration time = Duration();
  final Duration second = Duration(seconds: 1);
  Timer? timer;
  bool running = true;

  @override
  void initState() {
    double dividedBreakTime = widget.toCountDown.inSeconds / 5;
    time = Duration(seconds: dividedBreakTime.toInt());
    startTimer();
  }

  void startTimer(){
    timer = Timer.periodic(second, (timer) {
      decreaseTimer();
    });
  }

  void decreaseTimer(){

    if(time.inSeconds == 0){
      running = false;
    } else {
      final decSeconds = -1;
      setState(() {
        final seconds = time.inSeconds + decSeconds;
        time = Duration(seconds: seconds);
        print(time.inSeconds);
      });
    }
    setState(() {

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
        title: Center(child: Text("Break Phase")),
        automaticallyImplyLeading: false,
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
