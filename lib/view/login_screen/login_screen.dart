import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_call/view/home_screen/bottom_navigation.dart';
import 'package:m_call/view/login_screen/bloc/login_bloc.dart';
import 'package:m_call/view/utils/colors.dart';
import 'package:m_call/view/utils/fade_transition.dart';
import 'package:m_call/view/utils/fonts.dart';
import 'package:m_call/view/utils/mediaquery.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numbuerController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is loggedState) {
         Navigator.pushReplacement(context, FadeTransitionPageRoute(child: BottomNavigation()));
          
          }
     
   
        },
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height: mediaqueryHight(.4, context)),
                  Text(
                    "M Call",
                    style: appLogo(blackClr, Fweight: 800, size: 30),
                  ),
                  SizedBox(height: mediaqueryHight(.39, context)),
                  Text(
                    "Sign in",
                    style: flextext(blackClr, Fweight: 300, size: 15),
                  ),

                  SizedBox(height: mediaqueryHight(.01, context)),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(GoogleSignInEvent());
                    },
                    child: Container(
                      height: mediaqueryHight(.05, context),
                      width: mediaqueryWidth(.6, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Sign in with Google",
                          style: flextext(blackClr, Fweight: 500, size: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
