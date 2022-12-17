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
  const HomeScreen({
    Key key,
  }) : super(key: key);

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset("assets/icons/chat.png"),
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
                        height: 90,
                        width: double.infinity,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "INFO :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "Acara Internal :",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "Ujian Kenaikan level untuk Ballet, graduation (gathering/memberi sertifikat)",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                              ]),
                        )),
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
