import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_call/controller/authentication.dart';
import 'package:m_call/controller/caller.dart';
import 'package:m_call/controller/contact_controller.dart';
import 'package:m_call/view/add_contact/add_contact.dart';
import 'package:m_call/view/login_screen/login_screen.dart';
import 'package:m_call/view/utils/fade_transition.dart';
import 'package:m_call/view/utils/mediaquery.dart';
import 'package:m_call/view/utils/usercollection.dart';
import 'package:m_call/view/widgets/contact_navigation.dart';
import 'package:m_call/view/widgets/detail_card.dart';
import 'package:m_call/view/widgets/topbar.dart';

class ContactViewPage extends StatefulWidget {
  ContactViewPage({super.key, required this.selectedContact});
  final Map selectedContact;
  @override
  State<ContactViewPage> createState() => _ContactViewPageState();
}

class _ContactViewPageState extends State<ContactViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(223, 244, 243, 240),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color.fromARGB(158, 66, 34, 95),
                  width: mediaqueryWidth(10, context),
                  height: mediaqueryHight(.5, context),
                  child: Column(
                    children: [
                      SizedBox(height: mediaqueryHight(.15, context)),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(
                                255,
                                28,
                                28,
                                28,
                              ).withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: Offset(
                                0,
                                BorderSide.strokeAlignCenter,
                              ), // shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color.fromARGB(
                                83,
                                204,
                                94,
                                221,
                              ),
                              radius: 43,
                              child: Center(
                                child: Text(
                                  widget.selectedContact["firstname"][0]
                                      .toString()
                                      .toUpperCase(),
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 27,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          widget.selectedContact["firstname"] +
                              widget.selectedContact["lastname"],
                          style: GoogleFonts.aBeeZee(
                            fontSize: 27,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: mediaqueryHight(.085, context),
                        ),
                        child: ContactNavigation(
                          mobile: widget.selectedContact["mobile"],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    makePhoneCall("+91${widget.selectedContact["mobile"]}");
                  },
                  child: DetailCard(
                    subtit: "+91 " + widget.selectedContact["mobile"],
                    title: "Phone",
                  ),
                ),
                DetailCard(
                  subtit: widget.selectedContact["Company"] ?? "",
                  title: "company",
                ),
                DetailCard(
                  subtit: widget.selectedContact["email"] ?? "",
                  title: "Email",
                ),
                SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                   delete(context);
                  },
                  child: Text("Delete", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: TopBar(seleted: widget.selectedContact),
          ),
        ],
      ),
    );
  }

  delete(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "This contact will be remove from all your synced devices",style: GoogleFonts.aBeeZee(fontSize: 14),
            ),   actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Close dialog
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
              deleting(widget.selectedContact["firstname"]+widget.selectedContact["lastname"]);
            Navigator.of(context).pop(); 
              Navigator.of(context).pop(); // Close dialog first
           // Then make the call
          },
          child: Text("Delete"),
        ),
      ],
          ),
    );
  }
}
