import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sonatoni_calender/home_page.dart';
import 'package:sonatoni_calender/model/amaborsh_data.dart';
import 'package:sonatoni_calender/style/colors.dart';
import 'package:sonatoni_calender/style/style.dart';

class AmaborshScreen extends StatelessWidget {
  const AmaborshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          backgroundColor: appbarColor,
          title: Text("অমাবস্যা - ২০২৪", style: appbartext.copyWith()),
        ),
        body: ListView.builder(
            itemCount: amaborshaList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),

                  //elevation: 1,
                  child: ListTile(
                    //  leading: Text("${cutilist[index].id} ."),
                    title: Text("${amaborshaList[index].date}"),
                    //subtitle: Text("${amaborshaList[index].date}"),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
