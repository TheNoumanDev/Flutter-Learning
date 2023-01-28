import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/Views/Login_View.dart';
import 'package:practice_app/Views/Register_View.dart';

import 'firebase_options.dart';

// Hot reload doesn't work with main method so we need to restart the app
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      /*
       FutureBuilder is used to build the widget when the future is completed
       so we call the firebase.initializeApp method to initialize the firebase before
       creating the widgets and in builder we can implement things according to the 
       state of future such as while loading we can put the loading window and when
       it is completed we returned the column widget!
       */
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // final ButtonStyle style = ElevatedButton.styleFrom(
              //     textStyle: const TextStyle(fontSize: 20));
              final currentUser = FirebaseAuth.instance.currentUser;
              print(currentUser);
              if (currentUser?.emailVerified ?? false) {
                return const Text("Done!!!.");
              } else {
                return const verifyEmailView();
                // Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => const verifyEmailView()));
              }

            default:
              return const Text("Loading ....");
          }
        },
      ),
    );
  }
}

/*
after verification has completed in firebase u have to again login to app
to let firebase know that the user has verified his email so we need to
change the conditions according to it.
*/
class verifyEmailView extends StatefulWidget {
  const verifyEmailView({super.key});

  @override
  State<verifyEmailView> createState() => _verifyEmailViewState();
}

class _verifyEmailViewState extends State<verifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Verify your email"),
        TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser?.sendEmailVerification();
            },
            child: const Text("Send Verification Email"))
      ],
    );
  }
}
