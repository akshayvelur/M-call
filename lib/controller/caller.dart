import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void makePhoneCall(String phoneNumber) async {
  // final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
  // if (await canLaunchUrl(callUri)) {
  //   await launchUrl(callUri);
  // } else {
  //   print('Could not launch call');

  // }
    await FlutterPhoneDirectCaller.callNumber(phoneNumber);
}
