import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/bottomNavigationBar/views/bottom_navigation_bar_view.dart';
import 'package:meditation_app/app/modules/home/views/home_view.dart';
import 'package:meditation_app/app/modules/userProfile/views/user_profile_view.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage(
                  "assets/images/undraw_pilates_gpdb.png",
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 12,
                    ),
                    alignment: Alignment.bottomLeft,
                    width: 20,
                    child: InkWell(
                      onTap: (() {
                        Get.to(HomeView());
                      }),
                      child: Icon(Icons.arrow_back_sharp),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      "Dashboard Admin",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "short-baby-font",
                          fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      "Data Pemesan",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          // fontFamily: "short-baby-font",
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // grid
                  Container(
                    height: 300,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('pesanan')
                            .snapshots(),
                        builder: (__,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                              "eor",
                              style: TextStyle(
                                  fontSize: 100,
                                  color: Color.fromARGB(255, 226, 7, 7)),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              "Loading",
                              style: TextStyle(color: Colors.white),
                            );
                          }
                          final data = snapshot.requireData;
                          return ListView.builder(
                              itemCount: data.size,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, int index) {
                                return Container(
                                  height: 80,
                                  margin: EdgeInsets.all(2),
                                  padding: EdgeInsets.all(12),
                                  // height: 100,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(68, 255, 190, 190),
                                      borderRadius: BorderRadius.circular(12)),
                                  // decoration: BoxDecoration(
                                  //     color: Colors.grey,
                                  //     borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                      leading: Icon(Icons.check),
                                      trailing: Text(
                                        '${data.docs[index]['dance_diambil']}',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 15),
                                      ),
                                      title: Text(
                                          ' ${data.docs[index]['pembooking']}')),
                                );
                              });
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
