import 'package:flowmodoro/widgets/BreakScreen.dart';
import 'package:flowmodoro/widgets/ButtonWidget.dart';
import "package:flutter/material.dart";
import "dart:async";
import "../themes/themes.dart";

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration time = Duration();
  Duration second = Duration(seconds: 1);
  Duration minusSecond = Duration(seconds: -1);
  Timer? timer;
  bool running = false;

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
    if (running) {
      final second = 1;

      setState(() {
        final seconds = time.inSeconds + second;
        time = Duration(seconds: seconds);
      });
    }
  }

  void stop() {
    print("clicked");
    if (running) {
      running = false;
    } else {
      running = true;
    }
    setState(() {});
  }

  void breakFunction() {
    print("going to break phase");
    if (time.inSeconds.toInt() >= 10) {
      // time is longer than 10s so you can switch
      print("10s passed");
      stop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BreakScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(time.inMinutes.remainder(60));
    final seconds = twoDigits(time.inSeconds.remainder(60));

    return Container(
      child: Column(
        children: [
          Text(
            "$minutes:$seconds",
            style: Themes.timerStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: running ? "Stop" : "Start",
                onClick: stop,
                running: running,
              ),
              ButtonWidget(
                  text: "Break", onClick: breakFunction, running: running),
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
