import 'package:fcsmadproject/views/LadingView.dart';
import 'package:fcsmadproject/views/VerificationEmail.dart';
import 'package:fcsmadproject/views/registerView.dart';
import 'package:fcsmadproject/views/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/routes.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        registerViewRoute: (context) => const RegisterView(),
        LoginViewRoute: (context) => const LoginView(),
        landingViewRoute: (context) => const LandingView(),
        VerificationViewRoute: (context) => const VerificationEmail(),
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
       it is completed we returned the column widget! then they can also buuild this thngs
       using the plus function as compared to other values.
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
              return const LandingView(); //LoginView();
            } else {
              if (currentUser.emailVerified) {
                return const LandingView();
              } else {
                return const LandingView(); //verifyEmailView();
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
