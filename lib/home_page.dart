import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sonatoni_calender/app_data/amabosha.dart';
import 'package:sonatoni_calender/app_data/holyday.dart';
import 'package:sonatoni_calender/app_data/purnima.dart';
import 'package:sonatoni_calender/app_data/tithi_screen.dart';
import 'package:sonatoni_calender/style/style.dart';
import 'package:table_calendar/table_calendar.dart';

import 'app_data/akadosi.dart';
import 'style/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List sliderimagelist = [
    "assets/images/kr.jpg",
    "assets/images/dk.jpg",
    "assets/images/knto.jpg"
  ];
  var bodytext = TextStyle(
    fontSize: 18,
    color: Colors.red[400],
    fontFamily: "FL Mahfuj Brush",
  );
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bagroundColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 50,
            centerTitle: true,
            // backgroundColor: const Color(0xff4682A9),
            backgroundColor: appbarColor,
            //   backgroundColor: Color.fromARGB(255, 234, 208, 7),
            title: const Text(
              "সনাতনী কেলেন্ডার -২০২৪",
              style:
                  TextStyle(fontFamily: "FL Mahfuj Brush", color: Colors.white),
            )),
        body: ListView(
          children: [
            // Container(
            //   height: 1.5,
            //   color: Colors.white,
            // ),
            SizedBox(
              height: 200,
              //color: Colors.amber,
              child: PageView(
                controller: _controller,
                // onPageChanged: (index) {
                //   if (index == 2) {
                //     Get.to(const LoginScreen());
                //   }
                // },
                children: [
                  Image.asset(
                    "assets/images/kr1.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/kr2.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/kr3.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                  strokeWidth: 20,
                  dotColor: Colors.amber,
                  activeDotColor: Colors.green,
                ),
              ),
            ),

            // Container(
            //   color: Colors.amber,
            //   height: 200,
            //   child: Image.asset(
            //     "assets/images/kr2.jpg",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: 25,
              child: Center(
                  child: Marquee(
                blankSpace: 100.0,
                velocity: 20.0,
                text:
                    'হরেকৃষ্ণ হরেকৃষ্ণ    কৃষ্ণ কৃষ্ণ হরে হরে    হরে রাম হরে রাম',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red[400],
                    fontFamily: "FL Mahfuj Brush"),
              )),
            ),

            TableCalendar(
              // locale: "bn_BD",
              //locale: 'en_US',
              //ormatAnimationCurve: Curves.bounceInOut,
              formatAnimationDuration: Durations.extralong1,
              daysOfWeekHeight: 40,
              rowHeight: 40,

              daysOfWeekStyle: DaysOfWeekStyle(
                decoration: BoxDecoration(
                    color: bagroundColor,
                    //borderRadius:BorderRadius.only()
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 1.0)
                    ]),
                weekdayStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.teal[900],
                    fontFamily: 'Peddana',
                    fontWeight: FontWeight.w400),
                weekendStyle: const TextStyle(
                  fontSize: 24,
                  color: Color(0xfff4682A9),
                  fontFamily: 'Peddana',
                ),
              ),
              calendarFormat: CalendarFormat.month,

              // formatAnimationCurve: Curves.bounceInOut,
              pageAnimationEnabled: false,
              // pageAnimationCurve: Curves.linear,

              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              headerStyle: const HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.arrow_back,
                    // Icons.arrow_back_ios,
                    color: Colors.red,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward, size: 25,
                    //Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
                  headerMargin: EdgeInsets.zero,
                  formatButtonPadding: EdgeInsets.zero,
                  titleTextStyle: TextStyle(
                      fontFamily: "Peddana",
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                  formatButtonTextStyle:
                      TextStyle(fontFamily: "Peddana", color: Colors.red),
                  //formatButtonDecoration: BoxDecoration(),
                  formatButtonVisible: false,
                  titleCentered: true),

              calendarStyle: const CalendarStyle(
                  weekNumberTextStyle: TextStyle(color: Colors.purple),
                  rangeEndTextStyle: TextStyle(color: Colors.pink),
                  rangeStartTextStyle: const TextStyle(color: Colors.red),
                  cellMargin: EdgeInsets.only(top: 0),
                  holidayTextStyle: TextStyle(
                      color: Colors.red, backgroundColor: Colors.amber),
                  todayDecoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle)),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "২০২৪ সালের তথ্যবালি:",
                style: bodytext.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => HolydayScreen());
                        },
                        child: Text(
                          "ছুটির তালিকা -",
                          style: bodytext,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => AkadosiScreen());
                        },
                        child: Text(
                          "একাদশী - ",
                          style: bodytext.copyWith(color: Colors.green),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => const AmaborshScreen());
                        },
                        child: Text(
                          "আমবস্যা - ",
                          style: bodytext.copyWith(color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const PurnimaScreen());
                        },
                        child: Text(
                          "পূর্ণিমা - ",
                          style: bodytext.copyWith(color: Colors.purple),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const TithiScreen());
                        },
                        child: Text(
                          "বৈষ্ণবীয় তিথী - ",
                          style: bodytext.copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
