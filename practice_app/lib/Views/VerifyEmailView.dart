import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/constants/routes.dart';

/*
after verification has completed in firebase u have to again login to app
to let firebase know that the user has verified his email so we need to
change the conditions according to it.
*/

// ignore_for_file: camel_case_types
class verifyEmailView extends StatefulWidget {
  const verifyEmailView({super.key});

  @override
  State<verifyEmailView> createState() => _verifyEmailViewState();
}

class _verifyEmailViewState extends State<verifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: Column(
        children: [
          const Text("Verify your email"),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.currentUser
                    ?.sendEmailVerification();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(LoginViewRoute, (route) => false);
              },
              child: const Text("Send Verification Email"))
        ],
      ),
    );
  }
}
