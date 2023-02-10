import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meditation_app/home.dart';
import 'package:meditation_app/widgets/admin/bottomNav_admin.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';

class dashboardAdmin extends StatefulWidget {
  const dashboardAdmin({Key key}) : super(key: key);

  @override
  State<dashboardAdmin> createState() => _dashboardAdminState();
}

class _dashboardAdminState extends State<dashboardAdmin> {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }),
                        );
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
                    height: 240,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      "Data Pemesan",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          // fontFamily: "short-baby-font",
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.1, 1),
        child: FloatingActionButton.extended(
          onPressed: () {
            // cekLogin();
          },
          backgroundColor: Color.fromARGB(251, 252, 251, 235),
          label: Text(
            "Login",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarAdmin(),
    );
  }
}
