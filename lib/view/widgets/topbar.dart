
import 'package:flutter/material.dart';
import 'package:m_call/view/edit_contact.dart/edit_contact.dart';
import 'package:m_call/view/utils/fade_transition.dart';
import 'package:m_call/view/utils/mediaquery.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,required this.seleted
  });
 final Map seleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.1, context),
      width: mediaqueryWidth(10, context),
      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          ),
        TextButton(
    onPressed: () {
      Navigator.push(context, FadeTransitionPageRoute(child: EditContact(selectedContact: seleted)));
    },
    child: Text("Edit", style: TextStyle(color: Colors.white)),
      )]
      ),
    );
  }
}
