import "package:flutter/material.dart";
import "dart:async";

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

  void startTimer(){
    timer = Timer.periodic(second, (timer) {
      updateTime();
    });
  }

  void updateTime(){
    final second = 1;

    setState(() {
      final seconds = time.inSeconds + second;
      time = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text("hello"),
        Row(children: [
          Text("button1"),
          Text("button2")
        ],)
      ],),
    );
  }
}
