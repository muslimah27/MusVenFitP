import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/app/modules/home/views/home_view.dart';

class kpopPage extends StatefulWidget {
  const kpopPage({Key key}) : super(key: key);

  @override
  State<kpopPage> createState() => _kpopPageState();
}

class _kpopPageState extends State<kpopPage> {
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
    'assets/images/kpop1.jpeg',
    'assets/images/kpop2.jpeg',
    'assets/images/kpop3.jpeg',
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
                      "About Kpop",
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
                                "Mengenai Kpop",
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
                                "Kpop adalah adalah gabungan dari tarian lainnya, seperti Hip Hop, disko hingga salsa. Namun, tarian itu dikemas dengan alunan musik dari boyband atau girlband Korea Selatan. K-Pop dance bedanya kombinasi dan mengabungkan dengan Hip Hop, disko, hingga salsa juga ada",
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
            child: Container(
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar HipHop",
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
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tempat, Tanggal Lahir',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'No. Telepon',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const TextField(
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
                              onPressed: () {},
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
                              onPressed: () {},
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

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
