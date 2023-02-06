import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/Views/APIView.dart';
import 'package:practice_app/Views/AccountsView.dart';
import 'package:practice_app/Views/Login_View.dart';
import 'package:practice_app/Views/Register_View.dart';
import 'package:practice_app/Views/ForgetView.dart';
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

enum MenuActions { Logout, Settings }

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home UI"), actions: [
        PopupMenuButton<MenuActions>(
          onSelected: (value) {
            switch (value) {
              case MenuActions.Logout:
                showDialogBox(context).then((value) {
                  if (value) {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/LoginView', (route) => false);
                  }
                });
                break;
              case MenuActions.Settings:
                // TODO: Handle this case.
                break;
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: MenuActions.Logout,
                child: Text("Logout"),
              ),
              PopupMenuItem(
                value: MenuActions.Settings,
                child: Text("Setting"),
              ),
            ];
          },
        )
      ]),
    );
  }
}

Future<bool> showDialogBox(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Logout")),
        ],
      );
    },
  ).then((value) => value ?? false);
}
