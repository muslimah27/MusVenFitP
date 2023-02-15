import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailEditController extends GetxController {
  //TODO: Implement DetailEditController

  final count = 0.obs;

  String file_im = '';

  void UpImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75);

    Reference ref = FirebaseStorage.instance
        .ref()
        .child('FotoMinu/${file_im.toString()}_${DateTime.now()}.jpg');
    await ref.putFile(File(image.path));
    ref.getDownloadURL().then((value) {
      // print(value);
      // gambar(value);
      file_im = value;

      update();
    });
  }

  void clearGmbr() {
    file_im = '';
    update();
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
