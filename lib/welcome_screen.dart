import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo1.jpg'),
                    //height: 200.0,
                  ),
                ),
              ),
              TypewriterAnimatedTextKit(
                textAlign: TextAlign.center,
                text: ['Homemaker Companion'],
                speed: Duration(milliseconds: 400),
                textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlue,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                  title: 'Register',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
