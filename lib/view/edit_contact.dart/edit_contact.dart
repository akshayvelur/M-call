import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_call/view/add_contact/add_contact_bloc.dart';
import 'package:m_call/view/utils/mediaquery.dart';

class EditContact extends StatefulWidget {
  EditContact({super.key,required this.selectedContact});
    final Map selectedContact;

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  
  final TextEditingController _fristname = TextEditingController();

  TextEditingController _lastname = TextEditingController();

  TextEditingController _mobile = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _company = TextEditingController();
  @override
  void initState() {
    _fristname.text=widget.selectedContact["firstname"]??"";
    _lastname.text=widget.selectedContact["lastname"]??"";
    _company.text=widget.selectedContact["company"]??"";
    _email.text=widget.selectedContact["email"]??"";
    _mobile.text=widget.selectedContact["mobile"]??"";
    
    // TODO: implement initState
    super.initState();
  } 
  @override
  final formKey = GlobalKey<FormState>();

@override


  Widget build(BuildContext context) {
    return BlocConsumer<AddContactBloc, AddContactState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is AddContactSubmit){
          Navigator.pop(context);
           Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: ImageIcon(
                  AssetImage("assets/delete.png"),
                  color: Colors.red,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Edit Contact",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AddContactBloc>().add(
                         EditContactDataEvent(editname: widget.selectedContact["firstname"]+ widget.selectedContact["lastname"],
                          firstname: _fristname.text,
                          lastname: _lastname.text,
                          mobile: _mobile.text,
                          email: _email.text,
                          company: _company.text,
                        ),
                      );
                    }
                  },
                  icon: Icon(Icons.check),
                  color: Colors.green,
                  iconSize: 39,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13, top: 30),
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      // first name
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter name";
                          }
                        },
                        controller: _fristname,
                        decoration: InputDecoration(
                          labelText: "First name",
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaqueryHight(.05, context)),
                      // Last name
                      TextFormField(
                        controller: _lastname,
                        decoration: InputDecoration(
                          labelText: "Last name",
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaqueryHight(.05, context)),
                      // Email
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter mobile number";
                          }
                        },
                        controller: _mobile,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          labelText: "Mobile",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaqueryHight(.05, context)),
                      //
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: "Email",
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaqueryHight(.05, context)),
                      TextFormField(
                        controller: _company,
                        decoration: InputDecoration(
                          labelText: "Company",
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
      },
    );
  }
}
