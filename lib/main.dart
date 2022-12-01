import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';

import 'screens/details_screen.dart';
import 'widgets/category_card.dart';
import 'widgets/search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Able Ballet App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
          SafeArea(
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
                      child: SvgPicture.asset("assets/icons/menu.svg"),
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
                  Expanded(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        Card(
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
                              Text("Ballet")
                            ],
                          ),
                        ),
                        Card(
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
                              Text("Jazz")
                            ],
                          ),
                        ),
                        Card(
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
                              Text("Modern Dance")
                            ],
                          ),
                        ),
                        Card(
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
                              Text("Kpop")
                            ],
                          ),
                        ),
                        Card(
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
                              Text("HipHop")
                            ],
                          ),
                        ),
                        Card(
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
                              Text("Contemporary")
                            ],
                          ),
                        ),
                      ],
                    ),
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
