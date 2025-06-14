import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

googleAuthService() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;
      log("Authentication successful");
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
 
      try {
     await FirebaseAuth.instance.signInWithCredential(credential);
  
        await _firestore.collection("users").doc(_auth.currentUser!.uid).set({
          "uid":_auth.currentUser!.uid
        });
      } catch (e) {
        log(e.toString());
      }
    }
  } catch (e) {
    log(e.toString());
  }
}

SignOut() async {
  // firebase sign out
  await FirebaseAuth.instance.signOut();
  print("firebase sign out");
  // google sign out
  GoogleSignIn googleSignIn = GoogleSignIn();
  if (await googleSignIn.isSignedIn()) {
    await googleSignIn.signOut();
    print("google sign out");
  }
}
