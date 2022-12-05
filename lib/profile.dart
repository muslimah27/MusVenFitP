import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png")),
              // gradient: LinearGradient(
              //   colors: [
              //     Color.fromRGBO(4, 9, 35, 1),
              //     Color.fromRGBO(39, 105, 171, 1),
              //   ],
              //   begin: FractionalOffset.bottomCenter,
              //   end: FractionalOffset.topCenter,
              // ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                width: width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(-0.8, 0.8),
                      child: Text(
                        "Profil",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "harlow-solid-italic",
                            fontSize: 60),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 80,
                      foregroundImage: AssetImage("assets/icons/ballet.jpg"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                child: Center(
                                  child: Text(
                                    'MusVenFit',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontFamily: 'Caviar-Dreams',
                                      fontSize: 26,
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Profil Lengkap',
                              style: TextStyle(
                                color: Color.fromARGB(255, 107, 102, 102),
                                fontSize: 27,
                                fontFamily: 'Caviar-Dreams',
                              ),
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
                                    'Nama:',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 15,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5CEB8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Tempat, Tanggal Lahir:',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 15,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5CEB8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Email:',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 15,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5CEB8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Nomor Telepon:',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 15,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5CEB8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Dance yang diambil:',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 107, 102, 102),
                                      fontSize: 15,
                                      fontFamily: 'Caviar-Dreams',
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(15),
                              width: double.infinity,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5CEB8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
