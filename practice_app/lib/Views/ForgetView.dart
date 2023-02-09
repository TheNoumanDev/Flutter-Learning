import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/constants/routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 45.0),
        child: Column(
          children: [
            Row(
              children: const <Widget>[
                Icon(
                  Icons.lock_rounded,
                  color: Colors.orange,
                  size: 25.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Enter your email that you used to register your account, so we can send you a link to reset your password",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email *",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const TextField(
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: ("Enter your email"),
                border: OutlineInputBorder(
                  // <-- this is the important part
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {},
                child: const Text(
                  "Send Link",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Forgot your email?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " Try Phone Number",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // add code to handle the click event
                      },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 80.0),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AccountViewRoute, (route) => false);
                  },
                  child: const Text(
                    "/Account Page",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 40.0),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        APIViewRoute, (route) => false);
                  },
                  child: const Text(
                    "API Page",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                accountName: Text(
                  "Muhammad Nouman",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("TheNoumanDev@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' API Services '),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(APIViewRoute, (route) => false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.room_service),
              title: const Text(' Accounts Details '),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AccountViewRoute, (route) => false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Settings '),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
                FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(LoginViewRoute, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
