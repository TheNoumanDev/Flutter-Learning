import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        '/AcountsView', (route) => false);
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
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/APIView', (route) => false);
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
    );
  }
}
