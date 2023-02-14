import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/detail_able_ballet/views/detail_able_ballet_view.dart';
import 'package:meditation_app/widget/halaman/ballet.dart';
import 'package:meditation_app/widget/halaman/contemporary.dart';
import 'package:meditation_app/widget/halaman/hiphop.dart';
import 'package:meditation_app/widget/halaman/jazz.dart';
import 'package:meditation_app/widget/halaman/kpop.dart';
import 'package:meditation_app/widget/halaman/modern_dance.dart';

import '../../../../widget/search_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  //  HomeView({Key? key}) : super(key: key);
  // List text = [
  //   {
  //     'judul': ' Acara 1',
  //     'keterangan':
  //         'Ujian Kenaikan 1 level untuk Ballet, graduation (gathering/memberi sertifikat)'
  //   },
  //   {
  //     'judul': ' Acara 2',
  //     'keterangan':
  //         'Ujian Kenaikan 2 level untuk Ballet, graduation (gathering/memberi sertifikat)'
  //   },
  //   {
  //     'judul': ' Acara 3',
  //     'keterangan':
  //         'Ujian Kenaikan 3 level untuk Ballet, graduation (gathering/memberi sertifikat)'
  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
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
          SingleChildScrollView(
            child: Container(
              height: 1400,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 52,
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          "assets/icons/logo1.png",
                          height: 100,
                        ),
                      ),
                    ),
                    Text(
                      "Able Ballet",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "harlow-solid-italic",
                          fontSize: 60),
                    ),
                    SearchBar(),
                    Container(
                      height: 150,
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('info_acara')
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
                            final info_acara = snapshot.requireData;
                            return CarouselSlider(
                              items: List.generate(info_acara.size, (index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "INFO : ${info_acara.docs[index]["judul"]}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Caviar-Dreams',
                                      ),
                                    ),
                                    Text(
                                      "${info_acara.docs[index]["keterangan"]}",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 107, 102, 102),
                                        fontSize: 12,
                                        fontFamily: 'Caviar-Dreams',
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlay: true,
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('jenis_dance')
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
                            final jenis_dance = snapshot.requireData;
                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: jenis_dance.size,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (() {
                                    Get.to(() => DetailAbleBalletView(),
                                        arguments: {
                                          "jenis": jenis_dance.docs[index]
                                              ['jenis'],
                                          "mengenai": jenis_dance.docs[index]
                                              ['deskripsi']
                                        });
                                  }),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          jenis_dance.docs[index]['ikon'],
                                          height: 100,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          jenis_dance.docs[index]['jenis'],
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 107, 102, 102),
                                            fontSize: 18,
                                            fontFamily: 'Caviar-Dreams',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
