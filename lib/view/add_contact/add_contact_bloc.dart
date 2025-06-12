import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m_call/controller/contact_controller.dart';
import 'package:meta/meta.dart';

part 'add_contact_event.dart';
part 'add_contact_state.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {
  AddContactBloc() : super(AddContactInitial()) {
  on<AddContactDataEvent>(addContactDataEvent);
  }

  FutureOr<void> addContactDataEvent(AddContactDataEvent event, Emitter<AddContactState> emit) async{
// print("contact get");
  Map<String,dynamic>newContact={"firstname":event.firstname,
  "lastname":event.lastname,"mobile":event.mobile,"email":event.email,"company":event.company,"favorite":false};
 await addContactData(newContact);
 emit(AddContactSubmit());
  }
}
