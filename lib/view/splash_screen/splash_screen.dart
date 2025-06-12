import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_call/view/home_screen/bottom_navigation.dart';
import 'package:m_call/view/login_screen/bloc/login_bloc.dart';
import 'package:m_call/view/login_screen/login_screen.dart';
import 'package:m_call/view/utils/colors.dart';
import 'package:m_call/view/utils/fade_transition.dart';
import 'package:m_call/view/utils/fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<LoginBloc>().add(GoogleSignInCheckEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is NavigateToHomeState) {
       print('Home stste');
        Navigator.pushReplacement(context,FadeTransitionPageRoute(child: BottomNavigation()));
        }
      
        if (state is NavigateToLoginpState) {
            Navigator.push(context, FadeTransitionPageRoute(child: LoginScreen()));
        }
   
      },
      child: Scaffold(
        body: Center(
          child: Text(
            "M Call",
            style: appLogo(blackClr, Fweight: 800, size: 30),
          ),
        ),
      ),
    );
  }
}
