import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter Your Email",
                  hintStyle:
                      const TextStyle(fontSize: 20.0, color: Colors.grey)),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintStyle:
                      const TextStyle(fontSize: 20.0, color: Colors.grey),
                  hintText: "Enter Your Password"),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                colour: Colors.lightBlueAccent,
                title: "LogIn",
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
