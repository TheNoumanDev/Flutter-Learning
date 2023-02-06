import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/Views/APIView.dart';
import 'package:practice_app/Views/AccountsView.dart';
import 'package:practice_app/Views/Login_View.dart';
import 'package:practice_app/Views/Register_View.dart';
import 'package:practice_app/Views/ForgetView.dart';
import 'Views/MainUI.dart';
import 'Views/VerifyEmailView.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

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
      routes: {
        '/AcountsView': (context) => const AccountView(),
        '/ForgetView': (context) => const ForgotPasswordScreen(),
        '/APIView': (context) => const APIView(),
        '/LoginView': (context) => const LoginView(),
        '/RegisterView': (context) => const RegisterView(),
        '/MainUI': (context) => const MainUI(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /*
       FutureBuilder is used to build the widget when the future is completed
       so we call the firebase.initializeApp method to initialize the firebase before
       creating the widgets and in builder we can implement things according to the 
       state of future such as while loading we can put the loading window and when
       it is completed we returned the column widget!
       */
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final ButtonStyle style = ElevatedButton.styleFrom(
            //     textStyle: const TextStyle(fontSize: 20));
            final currentUser = FirebaseAuth.instance.currentUser;
            // print(currentUser);
            if (currentUser == null) {
              return const LoginView();
            } else {
              if (currentUser.emailVerified) {
                return const MainUI();
              } else {
                return const verifyEmailView();
              }
            }
          // Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => const verifyEmailView()));
          //}

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
