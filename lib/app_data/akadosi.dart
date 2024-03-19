import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatoni_calender/home_page.dart';
import 'package:sonatoni_calender/model/akadosi_data.dart';
import 'package:sonatoni_calender/model/cuti_model.dart';
import 'package:sonatoni_calender/style/colors.dart';
import 'package:sonatoni_calender/style/style.dart';

class AkadosiScreen extends StatefulWidget {
  AkadosiScreen({super.key});

  @override
  State<AkadosiScreen> createState() => _AkadosiScreenState();
}

class _AkadosiScreenState extends State<AkadosiScreen> {
  final searchController = TextEditingController();
  List<Akadosidata> searchdata = akadosilist;
  //search function ===========================================
  void searchfunction(String query) {
    final suggestions = akadosilist.where((data) {
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
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          backgroundColor: appbarColor,
          title: Text("একাদশী - ২০২৪", style: appbartext),
        ),
        body: Column(
          children: [
            // Text("সাধারণ ছুটি",
            //     style: TextStyle(
            //       fontSize: 18,
            //       color: Colors.red[400],
            //       // fontFamily: "FL Mahfuj Brush",
            //     )),
            // const SizedBox(
            //   height: 10,
            // ),
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
              color: Colors.grey[300],
            ),
            Expanded(
              //flex: 2,
              child: ListView.builder(
                  itemCount: searchdata.length,
                  // itemCount: akadosilist.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              //  leading: Text("${akadosilist[index].id} ."),
                              title: Text(
                                "${searchdata[index].name}",
                              ),
                              subtitle: Text(
                                "${searchdata[index].date}",
                              ),
                              trailing: Text(
                                "${searchdata[index].time} ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
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
