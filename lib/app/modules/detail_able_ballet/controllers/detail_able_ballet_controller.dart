import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DetailAbleBalletController extends GetxController {
  //TODO: Implement DetailAbleBalletController

  final count = 0.obs;
  var nama_user = ''.obs;

  void showDisplayName() async {
    var collection = FirebaseFirestore.instance.collection('users');
    //userUid is the current auth user
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser.email).get();
    var data = docSnapshot.data();
    var nama = data['nama'].toString();

    // point += pointt;

    // int a = pointt += poinPlus;
    nama_user = nama.obs;
    update();
    print(nama_user);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
