import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m_call/view/utils/colors.dart';
import 'package:m_call/view/utils/fonts.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        body: Center(
          child: Text(
            "M Call",
            style: appLogo(blackClr, Fweight: 800, size: 30),
          ),
        ),
      );
    
  }
}
