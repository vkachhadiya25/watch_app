import 'package:flutter/material.dart';
import 'package:watch_app/anlogwatch.dart';
import 'package:watch_app/digitalwatch.dart';
import 'package:watch_app/watch_screen.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WatchScreen(),
    ),
  );
}