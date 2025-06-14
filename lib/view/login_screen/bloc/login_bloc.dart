import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:m_call/controller/authentication.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()){
  on<GoogleSignInCheckEvent>(googleSignInCheckEvent);
  on<GoogleSignInEvent>(googleSignInEvent);
  }



  FutureOr<void> googleSignInCheckEvent(GoogleSignInCheckEvent event, Emitter<LoginState> emit) async{
  await Future.delayed(Duration(seconds: 1));
    FirebaseAuth auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
      print("already logged");
     emit(NavigateToHomeState()); 
    }else{
       print("waiting for login");
      emit(NavigateToLoginpState());
    }
  }
  FutureOr<void> googleSignInEvent(GoogleSignInEvent event, Emitter<LoginState> emit) async{
   print("hi login");
    FirebaseAuth auth=FirebaseAuth.instance;


      final user=auth.currentUser;
      if(user==null){
     await googleAuthService();
  if(auth.currentUser!.uid.isNotEmpty){
   emit(loggedState());
  }

    }else{
        

     }
 
  }
  }