import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meditation_app/app/modules/login/views/login_view.dart';

class AuthController {
  UserCredential _userCredential;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(googleUser.email);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

    //user store
    CollectionReference users = firestore.collection('users');
    final cekUser = await users.doc(googleUser.email).get();
    if (!cekUser.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential.user.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'createdAt': _userCredential.user.metadata.creationTime.toString(),
        'lasLoginAt': _userCredential.user.metadata.lastSignInTime.toString(),
      });
    } else {
      users.doc(googleUser.email).set({
        'lasLoginAt': _userCredential.user.metadata.lastSignInTime.toString(),
      });
    }
    // Get.offAllNamed(Routes.HOME);
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();

    Get.to(LoginView());
  }
}
