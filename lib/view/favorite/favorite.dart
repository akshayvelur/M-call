import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_call/controller/authentication.dart';
import 'package:m_call/controller/contact_controller.dart';
import 'package:m_call/view/add_contact/add_contact.dart';
import 'package:m_call/view/contact_view/contact_view.dart';
import 'package:m_call/view/login_screen/login_screen.dart';
import 'package:m_call/view/utils/fade_transition.dart';
import 'package:m_call/view/utils/mediaquery.dart';
import 'package:m_call/view/utils/usercollection.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});

  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _store = FirebaseFirestore.instance;
Stream<QuerySnapshot<Map<String, dynamic>>> getUsers =
    _store
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("contactList")
        .snapshots();

class _FavoritepageState extends State<Favoritepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true,title: Text("Favorite",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w500),),
        leadingWidth: 25,
        titleSpacing: 25,
        automaticallyImplyLeading: false,

        actions: [
          InkWell(
            onTap:
                () => Navigator.push(
                  context,
                  FadeTransitionPageRoute(child: AddContact()),
                ),
            child: Image.asset("assets/add.png", width: 30, height: 30),
          ),
          SizedBox(width: mediaqueryWidth(0.03, context)),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder(
              stream: getUsers,
              builder: (
                context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
              ) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  List<Map<String, dynamic>> contacts =
                      snapshot.data!.docs.map((doc) => doc.data()).toList();
                  if (contacts.isEmpty) {
                    return Container(
                      height: mediaqueryHight(0.79, context),
                      width: double.infinity,
                      child: Center(child: Text("Contact Empty")),
                    );
                  }
                  return ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                       Map<String,dynamic>view=contacts[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: contacts[index]["favorite"]?InkWell(onTap: () {
                          Navigator.push(context, FadeTransitionPageRoute(child: ContactViewPage(selectedContact: contacts[index])));
                        },
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 18),
                             title: Text(contacts[index]["firstname"]),trailing: IconButton(
                                onPressed: () {
                                  addFavorite(view);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color:
                                      contacts[index]["favorite"]
                                          ? Colors.red
                                          : Colors.white,
                                ),
                              ),
                          ),
                        ):SizedBox(),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
