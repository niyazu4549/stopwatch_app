import 'package:flutter/material.dart';
import 'package:stopwatch_app_flutter/stopwatch_screen.dart';

void main() {
  runApp(const stopwatchApp());
}

// ignore: camel_case_types
class stopwatchApp extends StatelessWidget {
  const stopwatchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StopWatch",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const stopWatchScreen(),
    );
  }
}