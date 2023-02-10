import 'package:flutter/material.dart';

import 'constants.dart';
import 'widgets/bottom_nav_bar.dart';

class Jadwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                                "SENIN:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "14.00 --> BABY CLASS",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "15.30 --> GRADE 3 (LENNY,MARIA)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "               1,5 JAM (QUENI,CELINE)",
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
                  Container(
                      height: 120,
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
                                "SELASA:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "14.00 --> PREBALLET (IVON)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "15.00 --> GRADE 3 (IVON)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "16.00 --> MD KIDS (KO ANDRI)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "17.00 --> PRIMARY (IVON)",
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
                                "RABU:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "14.30 --> KPOP KECIL (VENA)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "15.30 --> JAZZ KIDS (LIES)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "16.30 --> SUB EL (LIES)",
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
                  SingleChildScrollView(
                    child: Container(
                        // height: 90,
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
                                  "KAMIS:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "13.30 --> BABY CLASS (IVONE)",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "14.30 --> GRADE 6 (IVONE)",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "15.30 --> GRADE 5 (IVONE)",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "17.30 --> ADULT",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                              ]),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 120,
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
                                "JUMAT:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "13.30 --> TINY A (IVONE,LENNY)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "14.00 --> MD KIDS (KO ANDRI)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "15.00 --> MD BESAR (KO ANDRI)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 107, 102, 102),
                                  fontSize: 12,
                                  fontFamily: 'Caviar-Dreams',
                                ),
                              ),
                              Text(
                                "16.00 --> KPOP TEEN (VENA)",
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
                  SingleChildScrollView(
                    child: Container(
                        // height: 90,
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
                                  "SABTU:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "10.00 --> TINY A",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                                Text(
                                  "11.00 --> JAZZ KIDS",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 107, 102, 102),
                                    fontSize: 12,
                                    fontFamily: 'Caviar-Dreams',
                                  ),
                                ),
                              ]),
                        )),
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

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  get kShadowColor => null;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
