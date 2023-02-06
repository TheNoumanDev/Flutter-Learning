// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Variables
  late final TextEditingController _email;
  late final TextEditingController _password;

  // We need to initilize the texteditingcontroller in the initstate and also
  // dispose it in the dispose method. after code completion that thing is
  // compulsory
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          TextField(
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: ("Enter your email"),
            ),
            controller: _email,
          ),
          TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: ("Enter your password"),
            ),
            controller: _password,
          ),
          TextButton(
            onPressed: () async {
              try {
                final email = _email.text;
                final password = _password.text;
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password);
              } on FirebaseAuthException catch (e) {
                // you can check the exception type by e.runtimeType
                // and then to catch this specific exception you can use
                // on keyword with type behind catch keyword and then
                // use the e.code method to check the error code adn implement
                // the code accordingly.
                if (e.code == "user-not-found") {
                  print("No user found for that email");
                } else if (e.code == "wrong-password") {
                  print("Wrong password provided for that user");
                }
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/RegisterView', (route) => false);
            },
            child: const Text('If Not Register, Then Click Me!'),
          ),
        ],
      ),
    );
  }
}
