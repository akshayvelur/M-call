part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class NavigateToLoginpState extends LoginState{}
class NavigateToHomeState extends LoginState{}
class loggedState extends LoginState{}