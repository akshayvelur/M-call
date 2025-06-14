part of 'add_contact_bloc.dart';

@immutable
abstract class AddContactState {}

class AddContactInitial extends AddContactState {}
class AddContactSubmit extends AddContactState{}
class EditContactDataState extends AddContactState{}