import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routings/app_routers.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;

  GoogleSignIn googleSignIn = GoogleSignIn();

  GoogleSignInAccount? user;

  UserCredential? userCredential;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signOut();

      await googleSignIn.signIn().then((value) => user = value);

      final isSignIn = await googleSignIn.isSignedIn();

      if (isSignIn) {
        debugPrint(user.toString());
        debugPrint("Berhasil Login");

        final googleAuth = await user!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        SharedPreferences pref = await SharedPreferences.getInstance();

        await pref.setString('login', googleAuth.accessToken!);

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        debugPrint(userCredential.toString());

        CollectionReference collectionReference = firestore.collection("users");
        final checkUser = await collectionReference.doc(user!.email).get();

        if (checkUser.data() != null) {
          collectionReference.doc(user!.email).set({
            "uid": userCredential!.user!.uid,
            "name": user!.displayName,
            "email": user!.email,
            "photoUrl": user!.photoUrl,
            "createdAt":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "updateTime": DateTime.now().toIso8601String()
          });
        } else {
          collectionReference.doc(user!.email).update({
            "lastSignInTime":
                userCredential!.user!.metadata.lastSignInTime!.toIso8601String()
          });
        }

        if (user == null) {
          return;
        }

        isLogin(true);
        Get.toNamed(AppRouters.main);
      } else {
        debugPrint("Gagal Login");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
