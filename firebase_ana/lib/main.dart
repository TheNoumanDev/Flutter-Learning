import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'LandingPage.dart';
import 'SplashScreen.dart';
import 'firebase_options.dart';

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
        '/page2': (context) => SemanticsPage(),
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
            final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
            analytics.logAppOpen();
            return SplashScreen();
          // final ButtonStyle style = ElevatedButton.styleFrom(
          //     textStyle: const TextStyle(fontSize: 20));
          // final currentUser = FirebaseAuth.instance.currentUser;

          // if (currentUser == null) {
          //   return const LandingView();
          // } else {
          //   // if (currentUser.emailVerified) {
          //   return ProfileScreen(
          //     username: 'johndoe',
          //     title: 'Software Developer',
          //     imageUrl: 'https://example.com/profile.jpg',
          //     info: [
          //       Info(
          //         icon: Icons.email,
          //         title: 'Email',
          //         subtitle: 'johndoe@example.com',
          //       ),
          //       Info(
          //         icon: Icons.phone,
          //         title: 'Phone',
          //         subtitle: '555-555-5555',
          //       ),
          //     ],
          //   );
          //   // } else {
          //   //   return const verifyEmailView();
          //   // }
          // }
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
