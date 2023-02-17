import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/detailEdit/views/detail_edit_view.dart';
import 'package:meditation_app/app/modules/editDance/controllers/edit_dance_controller.dart';

import '../../bottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../controllers/edit_info_controller.dart';

class EditInfoView extends GetView<EditInfoController> {
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Info's View",
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
                        "Information",
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
                            final info = snapshot.requireData;
                            return ListView.builder(
                                itemCount: info.size,
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
                                        leading: Icon(Icons.inbox),
                                        trailing: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: (() {
                                                  BottomSheetEdit(
                                                      context, index, info);
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
                                                            info,
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
                                              ' ${info.docs[index]['judul']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              '${info.docs[index]['keterangan']}',
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
          heroTag: "btn2",
          onPressed: () {
            BottomSheetAdd(context);
            // Add your onPressed code here!
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ));
  }

  Future<void> BottomSheethapus(BuildContext context, info, index) {
    info;
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hapus Informasi",
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
                            labelText: info.docs[index]['judul'].toString(),
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
                                    .collection('info_acara')
                                    .doc(info.docs[index].id)
                                    .delete()
                                    .then((value) {
                                  Navigator.pop(context);

                                  print(
                                      "sukses Mengahpus ${info.docs[index]['info']}");

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 117, 163),
                                    content: Text(
                                        "HI, Sukses Mengahpus ${info.docs[index]['jenis']}"),
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

  Future<void> BottomSheetEdit(BuildContext context, index, info) {
    // final _gambarController = controller.file_im;
    final _judulInfoController = TextEditingController();
    final _deskripsiInfoController = TextEditingController();
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(20),
              // color: Colors.amber,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Info",
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
                          controller: _judulInfoController
                            ..text = info.docs[index]['judul'],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Judul Info',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          // minLines: 4,
                          maxLines: 3,
                          controller: _deskripsiInfoController
                            ..text = info.docs[index]['keterangan'],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Deskripsi Acara',
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
                                    .collection('info_acara')
                                    .doc(info.docs[index].id)
                                    .set({
                                  'judul': _judulInfoController.text,
                                  'keterangan': _deskripsiInfoController.text,
                                  // 'ikon': _gambarController.toString(),
                                }).then((value) {
                                  print("sukses Update info");
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 9, 255, 194),
                                    content: Text(
                                        "HI, Sukses Menambahkan ${_judulInfoController.text}"),
                                  ));
                                });
                              },
                              child: Text("Update"),
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
    final _judulController = TextEditingController();
    // final _gambarController = controller.file_im;
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
                      "Tambah Informasi",
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
                          controller: _judulController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Judul Informasi',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _deskripsiController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Deskripsi Informasi',
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
                                    .collection('info_acara')
                                    .add({
                                  'judul': _judulController.text,
                                  'keterangan': _deskripsiController.text,
                                  // 'ikon': _gambarController.toString(),
                                }).then((value) {
                                  print("sukses tambah");
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 117, 163),
                                    content: Text(
                                        "HI, Sukses Menambahkan ${_judulController.text}"),
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
