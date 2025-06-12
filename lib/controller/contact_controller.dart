import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

  addContactData(Map<String,dynamic> newContact) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //  contactList data adding
  try{
   await _firestore.collection("users").doc(_auth.currentUser!.uid).collection("contactList").doc(newContact['firstname']).set(newContact);
  }catch(e){
 log(e.toString());
  }

  }
