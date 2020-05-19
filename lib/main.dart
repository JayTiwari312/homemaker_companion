import 'package:flutter/material.dart';
import 'package:homemakercompanion/home_screen.dart';
import 'package:homemakercompanion/list_screen.dart';
import 'package:homemakercompanion/login_screen.dart';
import 'package:homemakercompanion/navbar.dart';
import 'package:homemakercompanion/registration_screen.dart';
import 'package:homemakercompanion/welcome_screen.dart';

void main() => runApp(HomemakerCompanion());

class HomemakerCompanion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ListScreen.id: (context) => ListScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        Navbar.id: (context) => Navbar(),
      },
    );
  }
}
