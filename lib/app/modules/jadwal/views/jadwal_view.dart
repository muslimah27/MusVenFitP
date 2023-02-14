import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    height: 80,
                    width: 52,
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      "assets/icons/logo1.png",
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      "Jadwal",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "harlow-solid-italic",
                          fontSize: 60),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 400,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('jadwal')
                            .orderBy('hari', descending: false)
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
                          final jadwal = snapshot.requireData;

                          return ListView.builder(
                            itemCount: jadwal.size,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.all(12),

                                  // height: 90,
                                  width: double.infinity,
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${jadwal.docs[index]['hari']}: ${jadwal.docs[index]['jam']} ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'Caviar-Dreams',
                                            ),
                                          ),
                                          Text(
                                            '${jadwal.docs[index]['nama'][0]}',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 107, 102, 102),
                                              fontSize: 12,
                                              fontFamily: 'Caviar-Dreams',
                                            ),
                                          ),
                                          Text(
                                            '${jadwal.docs[index]['nama'][1]}',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 107, 102, 102),
                                              fontSize: 12,
                                              fontFamily: 'Caviar-Dreams',
                                            ),
                                          ),
                                        ]),
                                  ));
                            },
                          );
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
