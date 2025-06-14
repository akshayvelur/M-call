
import 'package:flutter/material.dart';
import 'package:m_call/controller/caller.dart';

class ContactNavigation extends StatelessWidget {
  const ContactNavigation({
    super.key,required this.mobile

  });
    final String mobile;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {  makePhoneCall("+91${mobile}");},
            icon: Icon(Icons.call,color: Colors.green,),
          ),
            IconButton(
            onPressed: () {},
            icon: Icon(Icons.message,color: const Color.fromARGB(181, 199, 168, 75),),
          ),IconButton(
            onPressed: () {},
            icon: Icon(Icons.mail,color: Colors.blue,),
          ),
        ],
      
    );
  }
}
