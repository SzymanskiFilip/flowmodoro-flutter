import "package:flutter/material.dart";
import "dart:async";

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration time = Duration();
  Duration timeInMinutes = Duration();
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

    if(time.inSeconds > 59){
      timeInMinutes += Duration(minutes: 1);
      time = Duration(seconds: 0);
    }

    setState(() {
      final seconds = time.inSeconds + second;
      time = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(timeInMinutes.inMinutes.toString() + " : " + time.inSeconds.toString()),
        Row(children: [
          Text("button1"),
          Text("button2")
        ], mainAxisAlignment: MainAxisAlignment.center,)
      ], mainAxisAlignment: MainAxisAlignment.center,),
    );
  }
}
