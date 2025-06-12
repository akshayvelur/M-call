part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class GoogleSignInCheckEvent extends LoginEvent{

}
class GoogleSignInEvent extends LoginEvent{}