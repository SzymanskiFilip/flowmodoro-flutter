import "package:flutter/material.dart";
import "../themes/themes.dart";

class BreakScreen extends StatefulWidget {
  const BreakScreen({Key? key}) : super(key: key);

  @override
  _BreakScreenState createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {
  final Duration time = Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Break Phase"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("00:00", style: Themes.timerStyle,),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Add alarm on timer end, add a button to return back to timer
