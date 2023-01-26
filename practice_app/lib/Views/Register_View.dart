// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Column(
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
                print("password is too weak");
              } else if (e.code == "email-already-in-use") {
                print("email is already in use");
              } else if (e.code == "invalid-email") {
                print("email is invalid");
              }
            }
          },
          child: const Text('Register'),
        ),
        // ElevatedButton(
        //   style: style,
        //   onPressed: null,
        //   child: const Text('Disabled'),
        // ),
        // // implement container
        // Row(
        //   // verticalDirection:
        //   //     VerticalDirection.down, // to set where the  widgets starts from
        //   //mainAxisAlignment: MainAxisAlignment
        //   //   .spaceEvenly, // to defin where the widgets can be stored
        //   //crossAxisAlignment:
        //   //    CrossAxisAlignment.stretch, // to align along horizontal
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 60,
        //       margin: EdgeInsets.all(10),
        //       child: Text('Container 1'),
        //       color: Colors.blue,
        //     ),
        //     SizedBox(
        //       width: 30,
        //     ), // to give a bit of space between widgets
        //     Container(
        //       width: 100,
        //       height: 100,
        //       padding: const EdgeInsets.only(
        //           left: 10.0, right: 0, top: 40, bottom: 0),
        //       child: Text("Container 2"),
        //       color: Colors.yellow,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 60,
        //       padding: EdgeInsets.all(10),
        //       child: Text("Container 3"),
        //       color: Colors.red,
        //     )
        //   ],
        // ),
        // Expanded(
        //   child: Container(
        //     color: Colors.amber,
        //     width: 100,
        //     padding: const EdgeInsets.only(
        //         left: 10.0, right: 0, top: 80, bottom: 0),
        //     child: Text("Expanded"),
        //   ),
        // ),
        // //implement a icon button
        // Center(
        //   child: IconButton(
        //     iconSize: 100,
        //     icon: const Icon(
        //       Icons.add,
        //     ),
        //     // the color of the button when it is pressed
        //     color: Colors.black,
        //     hoverColor: Colors.red,
        //     // the method which is called
        //     // when button is pressed

        //     onPressed: () async {
        //       final email = _email.text;
        //       final password = _password.text;
        //       final UserCredential = await FirebaseAuth.instance
        //           .createUserWithEmailAndPassword(
        //               email: email, password: password);
        //     },
        //   ),
        // ),
      ],
    );
  }
}
