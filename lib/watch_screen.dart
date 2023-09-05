import 'dart:math';

import 'package:flutter/material.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  int hour = 0, min = 0, sec = 0, date = 0, month = 0, year = 0, day = 0;
  String? dayName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clock();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.75,
                width: MediaQuery.of(context).size.width * 0.75,
                child: CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 5,
                  value: hour / 12,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.70,
                width: MediaQuery.of(context).size.width * 0.70,
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 5,
                  value: min / 60,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.65,
                width: MediaQuery.of(context).size.width * 0.65,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 5,
                  value: sec / 60,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$dayName',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  Text(
                    '$date/$month/$year',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Text(
                    '$hour:$min:$sec',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),
                  ),
                  Text(
                    "PM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  // Text("33",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void clock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        min = DateTime.now().minute;
        sec = DateTime.now().second;
        date = DateTime.now().day;
        month = DateTime.now().month;
        year = DateTime.now().year;
        day = DateTime.now().weekday;

        switch(day)
        {
          case 0:
            dayName='Sunday';
            break;

          case 1:
            dayName='Monday';
            break;

          case 2:
            dayName='Tuesday';
            break;

          case 3:
            dayName='Sunday';
            break;

          case 4:
            dayName='Wendesday';
            break;

          case 5:
            dayName='Thursay';
            break;

          case 6:
            dayName='Friday';
            break;

          case 7:
            dayName='Saturday';
            break;

        }
        if (hour > 12) {
          hour = hour - 12;
        }
      });
      clock();
    });
  }
}
