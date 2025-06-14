part of 'add_contact_bloc.dart';

@immutable
abstract class AddContactEvent {}
class AddContactDataEvent extends AddContactEvent{
  final String firstname;
   final String lastname;
    final String mobile;
     final String email;
      final String company;

  AddContactDataEvent({required this.firstname, required this.lastname, required this.mobile, required this.email, required this.company});

}
class EditContactDataEvent extends AddContactEvent{
  final String editname;
  final String firstname;
   final String lastname;
    final String mobile;
     final String email;
      final String company;

  EditContactDataEvent({required this.editname,required this.firstname, required this.lastname, required this.mobile, required this.email, required this.company});
}