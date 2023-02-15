import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/app/modules/home/views/home_view.dart';

class hiphopPage extends StatefulWidget {
  const hiphopPage({Key key}) : super(key: key);

  @override
  State<hiphopPage> createState() => _hiphopPageState();
}

class _hiphopPageState extends State<hiphopPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController ttl = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController no_tlp = TextEditingController();
  TextEditingController danc = TextEditingController();
  create() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.email)
          .update({
        // "pembooking": FirebaseAuth.instance.currentUser.displayName,
        "dance_diambil": danc.text,
      });
    } catch (e) {
      print(e);
    }
  }

  cekLogin() async {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('Anda Harus Login');
        Login(context);
      } else {
        BottomSheet(context);
      }
    });
  }

  final List<String> images = [
    'assets/images/hiphop.jpeg',
    'assets/images/hiphop.png',
    'assets/images/hiphop2.png',
  ];
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
                            return HomeView();
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
                      "About HipHop",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "short-baby-font",
                          fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 160,
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(251, 252, 251, 235),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mengenai HipHop",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'monday-feelings-font',
                                ),
                              ),
                              Text(
                                " ",
                              ),
                              Text(
                                "HipHop adalah berbagai gaya tari jalanan yang terutama dilakukan untuk musik hip hop atau yang telah berkembang sebagai bagian dari budaya hip hop. Hal ini dipengaruhi oleh berbagai gaya yang diciptakan pada 1970-an dan dipopulerkan oleh kru tari di Amerika Serikat. ",
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
                      // height: 160,
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(251, 252, 251, 235),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider.builder(
                                itemCount: images.length,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                ),
                                itemBuilder: (context, index, realIdx) {
                                  return Container(
                                    child: Center(
                                        child: Image.network(images[index],
                                            fit: BoxFit.cover, width: 1000)),
                                  );
                                },
                              ),
                            ]),
                      )),
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
            cekLogin();
          },
          backgroundColor: Color.fromARGB(251, 252, 251, 235),
          label: Text(
            "Daftar",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Future<void> BottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 800,
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar Ballet",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'monday-feelings-font',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: danc,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Dance yang diambil',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ))),
                              onPressed: () {
                                create();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomeView();
                                  }),
                                );
                              },
                              child: Text("Setuju"),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ))),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Batal"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> Login(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 800,
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Anda Belum Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'monday-feelings-font',
                            ),
                          ),
                          Text(
                            "Silahkan Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'monday-feelings-font',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          // key: _formKey,
                          controller: nama,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: ttl,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("atau"),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            print("login dengan google");
                          },
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(children: [
                              Icon(
                                Icons.sign_language,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Sign In dengan Google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}