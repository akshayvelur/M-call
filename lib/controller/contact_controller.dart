import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:m_call/view/edit_contact.dart/edit_contact.dart';

  addContactData(Map<String,dynamic> newContact) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //  contactList data adding
  try{
   await _firestore.collection("users").doc(_auth.currentUser!.uid).collection("contactList").doc(newContact['firstname']+newContact['lastname']).set(newContact);
  }catch(e){
 log(e.toString());
  }
  }

  addFavorite(Map<String,dynamic>selected)async{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  try{
 final data= await _firestore.collection("users").doc(_auth.currentUser!.uid).collection("contactList").doc(selected["firstname"]+selected["lastname"]);
 DocumentSnapshot snapshot=await data.get();

final fav= await snapshot.get("favorite");
if(fav){
  data.update({"favorite":false});}else{
  data.update({"favorite":true});
}
}catch(e){
    log(e.toString());
  }

  }

editContact({String ?edit,Map<String,dynamic>? newContact})async{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  await _firestore.collection("users").doc(_auth.currentUser!.uid).collection("contactList").doc(edit).delete();
  //  contactList data adding
  try{
   await _firestore.collection("users").doc(_auth.currentUser!.uid).collection("contactList").doc(newContact!['firstname']+newContact!['lastname']).set(newContact!);
  }catch(e){
 log(e.toString());
  }
}

deleting(String dlt)async{
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  await _firestore.collection("users").doc(_auth.currentUser!.uid).collection("contactList").doc(dlt).delete();
  //  contactList data adding
}