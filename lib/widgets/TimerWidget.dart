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
    final second = 1;

    setState(() {
      final seconds = time.inSeconds + second;
      time = Duration(seconds: seconds);
    });
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
                text: "Stop",
                onClick: () => {print("hello")},
              ),
              ButtonWidget(text: "Break", onClick: () => {print("hello")})
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
