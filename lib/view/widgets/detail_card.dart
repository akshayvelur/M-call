


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_call/view/contact_view/contact_view.dart';
import 'package:m_call/view/utils/mediaquery.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.subtit,required this.title
  });
   final String title;
  final String subtit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        width: mediaqueryWidth(10, context),
        height: mediaqueryHight(.1, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18,top: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text(title,style: GoogleFonts.aBeeZee(
                  fontSize: 13,
                  color: Colors.black,
                ),),
                SizedBox(height: 6,),
                 Text(subtit.toString(),style: GoogleFonts.aBeeZee(
                  fontSize: 17,
                  color: Colors.blue,
                ),)
          ],),
        ),
      ),
    );
  }
}
