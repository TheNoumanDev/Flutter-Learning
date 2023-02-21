import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VerificationEmail extends StatefulWidget {
  const VerificationEmail({super.key});

  @override
  State<VerificationEmail> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<VerificationEmail> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
  }

  Widget ShowUpdateDialog(
    BuildContext context,
  ) {
    return SimpleDialog(
      title: const Center(
        child: Text('Updating record'),
      ),
      children: [
        Container(
          height: 150.0,
          width: 150.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        // Container(
        //   height: double.infinity,
        //   // child: SingleChildScrollView(
        //   //     physics: const AlwaysScrollableScrollPhysics(),
        //   //     // padding: const EdgeInsets.symmetric(
        //   //     //   horizontal: 40.0,
        //   //     //   vertical: 120.0,
        //   //     // ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Text(
        //         'Sign Up',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontFamily: 'OpenSans',
        //           fontSize: 30.0,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       const SizedBox(height: 30.0),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShowUpdateDialog(context);
  }
}
