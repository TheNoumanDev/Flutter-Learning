import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('I Am Really Poor')),
          backgroundColor: Colors.black54,
        ),
        body: Center(child: Image(image: AssetImage('images/ass.jpg'))),
        backgroundColor: Colors.white,
      ),
    );
  }
}
