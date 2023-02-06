// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:practice_app/constants/routes.dart';

import '../Utilitites/Error_dialogue.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Variables
  late final TextEditingController _email;
  late final TextEditingController _password;

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
        title: const Text("Register"),
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
                    .createUserWithEmailAndPassword(
                        email: email, password: password);
              } on FirebaseAuthException catch (e) {
                if (e.code == "weak-password") {
                  ShowDialogGeneric(
                      context, "The password provided is too weak.");
                } else if (e.code == "email-already-in-use") {
                  ShowDialogGeneric(
                      context, "The account already exists for that email.");
                } else if (e.code == "invalid-email") {
                  ShowDialogGeneric(context, "The email is invalid.");
                } else {
                  ShowDialogGeneric(context, "Something went wrong.");
                }
              } catch (e) {
                ShowDialogGeneric(context, "Error: ${e.toString()}");
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(LoginViewRoute, (route) => false);
              },
              child: const Text("If Registered, Then Login"))
        ],
      ),
    );
  }
}
