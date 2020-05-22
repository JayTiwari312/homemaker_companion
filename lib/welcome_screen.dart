import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:homemakercompanion/new_recipe_screen.dart';
import 'package:homemakercompanion/registration_screen.dart';
import 'components.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(
            begin: Colors.indigo.shade200, end: Colors.deepPurple.shade200)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: PreferredSizeWidget(),
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 80.0),
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo5.png'),
                  height: 200.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ColorizeAnimatedTextKit(
              textAlign: TextAlign.center,
              text: ['Homemaker Companion'],
              colors: [
                Colors.red.shade800,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.indigo,
                Colors.deepPurple,
              ],
              //speed: Duration(milliseconds: 100),
              //pause: Duration(milliseconds: 50),
              textStyle: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Niconne',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.pinkAccent.shade200,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
                title: 'Register',
                colour: Colors.pink.shade600,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
