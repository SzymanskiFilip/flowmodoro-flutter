import 'dart:async';

import "package:flowmodoro/widgets/ButtonWidget.dart";
import "package:flutter/material.dart";
import "../themes/themes.dart";
import "package:flutter_ringtone_player/flutter_ringtone_player.dart";


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
  bool alarm = false;

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
      FlutterRingtonePlayer.playNotification(asAlarm: true);
      running = false;
      time = Duration(seconds: -1);
    } else {
      final decSeconds = -1;
      setState(() {
        final seconds = time.inSeconds + decSeconds;
        time = Duration(seconds: seconds);
        print(time.inSeconds);
      });
    }
    setState(() {});
  }

  void onBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String minutes = twoDigits(time.inMinutes.remainder(60));
    String seconds = twoDigits(time.inSeconds.remainder(60));

    if(time.inSeconds < 0){
      minutes = "00";
      seconds = "00";
    }

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