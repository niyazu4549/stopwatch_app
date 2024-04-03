import 'dart:async';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class stopWatchScreen extends StatefulWidget {
  const stopWatchScreen({super.key});

  @override
  State<stopWatchScreen> createState() => _stopWatchScreen();
}

// ignore: camel_case_types
class _stopWatchScreen extends State<stopWatchScreen> {
  String hoursString = "00", minutesString = "00", secondsString = "00";
  int hours = 0, minutes = 0, seconds = 0;
  bool isTimerRunner = false, isResetButtonVisible = false;
  late Timer _timer;

  //start timer
  void startTimer() {
    setState(() {
      isTimerRunner = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _startSecond();
    });
  }

  //pause timer
  void pauseTimer() {
    _timer.cancel();
    setState(() {
      isTimerRunner = false;
    });
    isResetButtonVisible = checkValues();
  }

  //start second
  void _startSecond() {
    setState(() {
      if (seconds < 59) {
        seconds++;
        secondsString = secondsString.toString();
        if (secondsString.length == 1) {
          secondsString = "0$secondsString";
        }
      } else {
        _startMinute();
      }
    });
  }

  //start minute
  void _startMinute() {
    setState(() {
      if (minutes < 59) {
        minutes = 0;
        minutesString = "00";
        minutes++;
        minutesString = minutes.toString();
        if (minutesString.length == 1) {
          minutesString = "0$minutesString";
        } else {
          _startHour();
        }
      }
    });
  }

  //start hour
  void _startHour() {
    setState(() {
      if (hours < 59) {
        seconds = 0;
        minutes = 0;
        secondsString = "00";
        minutesString = "00";
        hours++;
        hoursString = hoursString.toString();
        if (hoursString.length == 1) {
          hoursString = "0$hoursString";
        }
      }
    });
  }

  //reset timer
  void resetTimer() {
    _timer.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;
      secondsString = "00";
      minutesString = "00";
      hoursString = "00";
      isResetButtonVisible = false;
    });
  }

  bool checkValues() {
    if (seconds != 0 || minutes != 0 || hours != 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: const Text(
          "StopWatch",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$hoursString:$minutesString:$secondsString",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: () {
                if (isTimerRunner) {
                  pauseTimer();
                } else {
                  startTimer();
                }
              },
              child: Text(isTimerRunner ? "Pause" : "Play"),
            ),
            isResetButtonVisible
                ? ElevatedButton(
                    onPressed: () {
                      resetTimer();
                    },
                    child: const Text("Reset"),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
