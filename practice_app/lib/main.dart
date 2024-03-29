import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/Views/APIView.dart';
import 'package:practice_app/Views/AccountsView.dart';
import 'package:practice_app/Views/InsertRecordAPI.dart';
import 'package:practice_app/Views/LandingView.dart';
import 'package:practice_app/Views/Login_View.dart';
import 'package:practice_app/Views/Register_View.dart';
import 'package:practice_app/Views/ForgetView.dart';
import 'package:practice_app/constants/routes.dart';
import 'Views/File.dart';
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
        AccountViewRoute: (context) => const AccountView(),
        ForgetViewRoute: (context) => const ForgotPasswordScreen(),
        APIViewRoute: (context) => const APIView(),
        LoginViewRoute: (context) => const LoginView(),
        RegisterViewRoute: (context) => const RegisterView(),
        MainUIRoute: (context) => const MainUI(),
        InsertAPIRoute: (context) => const InsertData(),
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

            if (currentUser == null) {
              return const LandingView();
            } else {
              // if (currentUser.emailVerified) {
              return ProfileScreen(
                username: 'johndoe',
                title: 'Software Developer',
                imageUrl: 'https://example.com/profile.jpg',
                info: [
                  Info(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: 'johndoe@example.com',
                  ),
                  Info(
                    icon: Icons.phone,
                    title: 'Phone',
                    subtitle: '555-555-5555',
                  ),
                ],
              );
              // } else {
              //   return const verifyEmailView();
              // }
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
