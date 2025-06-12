import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:m_call/view/add_contact/add_contact_bloc.dart';
import 'package:m_call/view/login_screen/bloc/login_bloc.dart';
import 'package:m_call/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔹 This is the important line
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => LoginBloc()),
        Provider(create: (context) => AddContactBloc()),
      ],
      child: MaterialApp(
        title: 'M Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
