import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/adminDashboard/views/admin_dashboard_view.dart';

import '../../bottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../controllers/detail_edit_controller.dart';

class DetailEditView extends GetView<DetailEditController> {
  @override
  final _jenisController = TextEditingController();
  final _ikonController = TextEditingController();
  final _deskipsiController = TextEditingController();

  Widget build(BuildContext context) {
    final DetailEditController controller = Get.find();

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
                        Get.to(() => AdminDashboardView(), arguments: {
                          "id": Get.arguments['id'],
                          "jenis": Get.arguments['jenis'],
                          "mengenai": Get.arguments['mengenai'],
                          "ikon": Get.arguments['ikon'],
                        });
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
                      "Detail Edit",
                      // Get.arguments['jenis'],
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "short-baby-font",
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  // grid
                  Container(
                    // height: 400,
                    child: Column(
                      children: [
                        TextField(
                          controller: _jenisController
                            ..text = Get.arguments['jeniss'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 37, 37),
                          ),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 95, 37, 37),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: " Nama Dance ",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 95, 37, 37),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //

                        //
                        TextField(
                          maxLines: 6,
                          controller: _deskipsiController
                            ..text = Get.arguments['mengenai'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 37, 37),
                          ),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 95, 37, 37),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Nama Dance",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 95, 37, 37),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        //
                        GetBuilder<DetailEditController>(
                          init: DetailEditController(),
                          initState: (_) {},
                          builder: (_) {
                            return Column(
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    alignment: Alignment.topLeft,
                                    // width: 80,
                                    // height: 80,
                                    child: Text(
                                      "pilih Gambar",
                                    )),
                                InkWell(
                                  onTap: () {
                                    print("Browse Gambar");
                                    controller.UpImage();
                                    controller.clearGmbr();
                                  },
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    // width: 80,
                                    // height: 80,
                                    child: controller.file_im == null
                                        ? Icon(
                                            Icons
                                                .photo_size_select_actual_rounded,
                                            size: 80,
                                            color: Color.fromARGB(
                                                153, 233, 30, 98),
                                          )
                                        : Image.network(
                                            controller.file_im,
                                            height: 50,
                                          ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        InkWell(
                          onTap: () {
                            //
                            FirebaseFirestore.instance
                                .collection("jenis_dance")
                                .doc(Get.arguments['id'])
                                .update({
                              'jenis': _jenisController.text,
                              'deskripsi': _deskipsiController.text,
                              'ikon': controller.file_im.toString(),
                            }).then((value) {
                              print("sukses Update");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 117, 163),
                                  content: Text(
                                      "HI, Sukses Update ${_jenisController.text}"),
                                ),
                              );
                            });
                            //
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 233, 91, 138)),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 238, 238, 238),
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
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
