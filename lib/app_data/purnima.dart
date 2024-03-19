import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sonatoni_calender/home_page.dart';
import 'package:sonatoni_calender/model/purnima_data.dart';
import 'package:sonatoni_calender/style/colors.dart';
import 'package:sonatoni_calender/style/style.dart';

class PurnimaScreen extends StatelessWidget {
  const PurnimaScreen({super.key});

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
          title: Text("পূর্ণিমা - ২০২৪", style: appbartext.copyWith()),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: MasonryGridView.builder(
                  itemCount: purnimaList.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Container(
                        //height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("${purnimaList[index].date}"),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Text("পূর্ণিমা - ২০২৪",
                style: appbartext.copyWith(color: Colors.black)),
            Expanded(
              flex: 1,
              child: MasonryGridView.builder(
                  itemCount: purnimaList.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Container(
                        //height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("${purnimaList[index].date}"),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),

        // body: ListView.builder(
        //     itemCount: purnimaList.length,
        //     itemBuilder: (_, index) {
        //       return Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.white,
        //           ),

        //           //elevation: 1,
        //           child: ListTile(
        //             //  leading: Text("${cutilist[index].id} ."),
        //             title: Text("${purnimaList[index].date}"),
        //             // subtitle: Text("${tithiList[index].date}"),
        //           ),
        //         ),
        //       );
        //     }),
      ),
    );
  }
}
