import 'package:flash_chat/components/Rounded_Button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
  static const String id = 'WelcomeScreen';
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 1,
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(flex: 4, child: Container()),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        height: 100,
                        child: Image.asset(
                          'images/logo.png',
                          scale: 1,
                        ),
                      ),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flash chat',
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w900,
                          ),
                          speed: const Duration(milliseconds: 500),
                        ),
                      ],
                      totalRepeatCount: 4,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Expanded(
                flex: 1,
                child: RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Log In',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: RoundedButton(
                  colour: Colors.blueAccent,
                  title: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ),
              Expanded(flex: 4, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
