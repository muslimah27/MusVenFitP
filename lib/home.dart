import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'ballet.dart';
import 'contemporary.dart';
import 'hiphop.dart';
import 'jazz.dart';
import 'kpop.dart';
import 'modern_dance.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);
  List text = [
    {
      'judul': ' Acara 1',
      'keterangan':
          'Ujian Kenaikan 1 level untuk Ballet, graduation (gathering/memberi sertifikat)'
    },
    {
      'judul': ' Acara 2',
      'keterangan':
          'Ujian Kenaikan 2 level untuk Ballet, graduation (gathering/memberi sertifikat)'
    },
    {
      'judul': ' Acara 3',
      'keterangan':
          'Ujian Kenaikan 3 level untuk Ballet, graduation (gathering/memberi sertifikat)'
    }
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
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
                      child: CarouselSlider(
                        items: List.generate(text.length, (index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "INFO : ${text[index]["judul"]}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "${text[index]["keterangan"]}",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
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
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return balletPage();
                                }),
                              );
                            }),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/ballet.jpg",
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Ballet",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 18,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return jazzPage();
                                }),
                              );
                            }),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/jazz.jpg",
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Jazz",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 18,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return moderndancePage();
                                }),
                              );
                            }),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/MD.jpg",
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Modern Dance",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 18,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return kpopPage();
                                }),
                              );
                            }),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/kpop.jpg",
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Kpop",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 18,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return hiphopPage();
                                }),
                              );
                            }),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/hiphop1.jpg",
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "HipHop",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 18,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return contemporaryPage();
                                }),
                              );
                            }),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/contemporary.jpg",
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Contemporary",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 18,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
