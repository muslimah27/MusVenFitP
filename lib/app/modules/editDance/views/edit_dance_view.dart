import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/detailEdit/views/detail_edit_view.dart';

import '../../bottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../controllers/edit_dance_controller.dart';

class EditDanceView extends GetView<EditDanceController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: 200,
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
                          Get.to(BottomNavigationBarView());
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
                        "Dance's View",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "short-baby-font",
                            fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Data Dance's",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: "short-baby-font",
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // grid
                    Container(
                      height: 600,
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
                            final dance = snapshot.requireData;
                            return ListView.builder(
                                itemCount: dance.size,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, int index) {
                                  return Container(
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(12),
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(68, 255, 190, 190),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                        leading: Image.network(
                                            dance.docs[index]['ikon']),
                                        trailing: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: (() {
                                                  Get.to(() => DetailEditView(),
                                                      arguments: {
                                                        "id": dance
                                                            .docs[index].id,
                                                        "jeniss":
                                                            dance.docs[index]
                                                                ['jenis'],
                                                        "mengenai":
                                                            dance.docs[index]
                                                                ['deskripsi'],
                                                        "ikon":
                                                            dance.docs[index]
                                                                ['ikon'],
                                                      });
                                                }),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        BottomSheethapus(
                                                            context,
                                                            dance,
                                                            index);
                                                      },
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ' ${dance.docs[index]['jenis']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              '${dance.docs[index]['deskripsi']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 85, 85, 85),
                                                  fontSize: 15),
                                            ),
                                          ],
                                        )),
                                  );
                                });
                          }),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BottomSheetAdd(context);
            // Add your onPressed code here!
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ));
  }

  Future<void> BottomSheethapus(BuildContext context, dance, index) {
    dance;
    final _jenisController = TextEditingController();
    final _gambarController = controller.file_im;
    final _deskripsiController = TextEditingController();
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
                      "Hapus Dance",
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
                          // controller: _jenisController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: dance.docs[index]['jenis'].toString(),
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
                                FirebaseFirestore.instance
                                    .collection('jenis_dance')
                                    .doc(dance.docs[index].id)
                                    .delete()
                                    .then((value) {
                                  print(
                                      "sukses Mengahpus ${dance.docs[index]['jenis']}");
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 117, 163),
                                    content: Text(
                                        "HI, Sukses Mengahpus ${dance.docs[index]['jenis']}"),
                                  ));
                                });
                                // create();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) {
                                //     return HomeView();
                                //   }),
                                // );
                              },
                              child: Text("Hapus"),
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

  Future<void> BottomSheetAdd(BuildContext context) {
    final _jenisController = TextEditingController();
    final _gambarController = controller.file_im;
    final _deskripsiController = TextEditingController();
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
                      "Tamabh Dance",
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
                          controller: _jenisController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama Dance',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _deskripsiController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Deskripsi',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<EditDanceController>(
                          init: EditDanceController(),
                          initState: (_) {},
                          builder: (_) {
                            return InkWell(
                              onTap: () {
                                print("Browse Gambar");
                                controller.UpImage();
                                controller.clearGmbr();
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                // width: 80,
                                // height: 80,
                                child: controller.file_im == ""
                                    ? Icon(
                                        Icons.photo_size_select_actual_rounded,
                                        size: 80,
                                        color: Color.fromARGB(153, 233, 30, 98),
                                      )
                                    : Image.network(
                                        controller.file_im,
                                        height: 50,
                                      ),
                              ),
                            );
                          },
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
                                FirebaseFirestore.instance
                                    .collection('jenis_dance')
                                    .add({
                                  'jenis': _jenisController.text,
                                  'deskripsi': _deskripsiController.text,
                                  'ikon': _gambarController.toString(),
                                }).then((value) {
                                  print("sukses Update");
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 117, 163),
                                    content: Text(
                                        "HI, Sukses Menambahkan ${_jenisController.text}"),
                                  ));
                                });
                                // create();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) {
                                //     return HomeView();
                                //   }),
                                // );
                              },
                              child: Text("Simpan"),
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
}
