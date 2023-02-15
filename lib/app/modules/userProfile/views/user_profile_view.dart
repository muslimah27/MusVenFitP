import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/widget/controller/controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  final auth = AuthController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                height: 800,
                alignment: Alignment.centerLeft,
                width: width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .where('email',
                            isEqualTo: FirebaseAuth.instance.currentUser.email)
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          "Loading",
                          style: TextStyle(color: Colors.white),
                        );
                      }

                      final data = snapshot.requireData;
                      return ListView.builder(
                        itemCount: data.size,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return data.docs[index]['nama'] == "Mus"
                              ? Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        // height: 120.0,
                                        width: 300.0,
                                        // color: Colors.blue[50],
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Image.asset(
                                            "assets/icons/logo1.png",
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 80,
                                      // foregroundImage: AssetImage("assets/icons/ballet.png"),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          double innerHeight =
                                              constraints.maxHeight;
                                          double innerWidth =
                                              constraints.maxWidth;
                                          return Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  print("object");
                                                  auth.signOut();
                                                },
                                                child: Container(
                                                  height: innerHeight * 0.72,
                                                  width: innerWidth,
                                                  child: Center(
                                                    child: Text(
                                                      'MusVenFit',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 107, 102, 102),
                                                        fontFamily:
                                                            'Caviar-Dreams',
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: height * 0.8,
                                      width: width * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Profilmu",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 107, 102, 102),
                                                fontSize: 27,
                                                fontFamily: 'Caviar-Dreams',
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                auth.signOut();
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Color.fromARGB(
                                                      255,
                                                      253,
                                                      126,
                                                      117,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Logout",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )),
                                            ),
                                            Divider(
                                              thickness: 2,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Anda Login Sebagai Admin',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 107, 102, 102),
                                                      fontSize: 23,
                                                      fontFamily:
                                                          'Caviar-Dreams',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                print("Kehalaman Admin");
                                                Get.offAllNamed(
                                                    Routes.ADMIN_DASHBOARD);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Color.fromARGB(
                                                        255, 255, 157, 157)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Lanjut Kehalaman Admin',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            'Caviar-Dreams',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 22,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          double innerHeight =
                                              constraints.maxHeight;
                                          double innerWidth =
                                              constraints.maxWidth;
                                          return Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  print("object");
                                                },
                                                child: Container(
                                                  height: innerHeight * 0.72,
                                                  width: innerWidth,
                                                  child: Center(
                                                    child: Text(
                                                      'MusVenFit',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 107, 102, 102),
                                                        fontFamily:
                                                            'Caviar-Dreams',
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: height * 0.8,
                                      width: width * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Profilmu",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 107, 102, 102),
                                                fontSize: 27,
                                                fontFamily: 'Caviar-Dreams',
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                auth.signOut();
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Color.fromARGB(
                                                      255,
                                                      253,
                                                      126,
                                                      117,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Logout",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )),
                                            ),
                                            Divider(
                                              thickness: 2,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Nama: ${data.docs[index]['nama']}',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 107, 102, 102),
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Caviar-Dreams',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              padding: EdgeInsets.all(15),
                                              width: double.infinity,
                                              height: height * 0.1,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5CEB8),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'tanggal Lahir: ${data.docs[index]['ttl']}',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 107, 102, 102),
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Caviar-Dreams',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              padding: EdgeInsets.all(15),
                                              width: double.infinity,
                                              height: height * 0.1,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5CEB8),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Email: ${data.docs[index]['email']}',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 107, 102, 102),
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Caviar-Dreams',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              padding: EdgeInsets.all(15),
                                              width: double.infinity,
                                              height: height * 0.1,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5CEB8),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Nomor Telepon: ${data.docs[index]['nomor_telepon'].toString()}',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 107, 102, 102),
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Caviar-Dreams',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              padding: EdgeInsets.all(15),
                                              width: double.infinity,
                                              height: height * 0.1,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5CEB8),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data.docs[index][
                                                                'dance_diambil'] ==
                                                            null
                                                        ? "Dance diambil belum ada"
                                                        : 'Dance yang diambil: ${data.docs[index]['dance_diambil']} ',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 107, 102, 102),
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Caviar-Dreams',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              padding: EdgeInsets.all(15),
                                              width: double.infinity,
                                              height: height * 0.1,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5CEB8),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                );
                        },
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
