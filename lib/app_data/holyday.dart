import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatoni_calender/home_page.dart';
import 'package:sonatoni_calender/model/cuti_model.dart';
import 'package:sonatoni_calender/style/colors.dart';
import 'package:sonatoni_calender/style/style.dart';

class HolydayScreen extends StatefulWidget {
  HolydayScreen({super.key});

  @override
  State<HolydayScreen> createState() => _HolydayScreenState();
}

class _HolydayScreenState extends State<HolydayScreen> {
  final searchController = TextEditingController();
  List<CutiModeldata> searchdata = cutilist;
  //search function ===========================================
  void searchfunction(String query) {
    final suggestions = cutilist.where((data) {
      final akadosifilterlist = data.date.toLowerCase();
      final input = query.toLowerCase();
      return akadosifilterlist.contains(input);
    }).toList();
    setState(() {
      searchdata = suggestions;
    });
  }

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
          title: Text("ছুটির তালিকা - ২০২৪", style: appbartext.copyWith()),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      // enabledBorder: const UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.red)),
                      // focusedBorder: const UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.amber)),
                      // hoverColor: Colors.amber,
                      // iconColor: Colors.green,
                      // fillColor: Colors.red,
                      // focusColor: Colors.green,
                      contentPadding: const EdgeInsets.only(
                        bottom: 5,
                        left: 10,
                      ),
                      hintText: "মাসের নাম লিখুন :",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        // borderSide:
                        //     const BorderSide(style: BorderStyle.solid),
                      ),
                    ),
                    onChanged: searchfunction,
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey[400],
              width: double.maxFinite,
            ),
            Expanded(
              //flex: 2,
              child: ListView.builder(
                  itemCount: searchdata.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),

                        //elevation: 1,
                        child: ListTile(
                          //  leading: Text("${searchdata[index].id} ."),
                          title: Text("${searchdata[index].title}"),
                          subtitle: Text("${searchdata[index].date}"),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  List cutillist = [];
}
