import 'package:flutter/material.dart';

class digitalwatch extends StatefulWidget {
  const digitalwatch({super.key});

  @override
  State<digitalwatch> createState() => _digitalwatchState();
}

class _digitalwatchState extends State<digitalwatch> {
  int hour = 0, minute = 0, second = 0, date = 0, month = 0, year = 0;

  @override
  void initState() {
    super.initState();
    digitalClock();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.40,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      value: second / 60,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.40,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      value: hour / 12,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$date/$month/$year",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.green,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "$hour",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.green,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "$minute",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "PM",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(child: Image.asset("assets/image/p1.png")),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    child: Image.asset(
                  "assets/image/p2.png",
                  width: 30,
                )),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    child: Image.asset(
                  "assets/image/p3.png",
                  width: 30,
                )),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    child: Image.asset(
                  "assets/image/p4.png",
                  width: 35,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void digitalClock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        minute = DateTime.now().minute;
        second = DateTime.now().second;
        date = DateTime.now().day;
        month = DateTime.now().month;
        year = DateTime.now().year;
        digitalClock();
      });
    });
    if (hour > 12) {
      hour = hour - 12;
    }
  }
}
