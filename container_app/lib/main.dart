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
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          // verticalDirection:
          //     VerticalDirection.down, // to set where the  widgets starts from
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // to defin where the widgets can be stored
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // to align along horizontal
          children: [
            Container(
              width: 100,
              child: Text('Container 1'),
              color: Colors.white,
            ),
            SizedBox(), // to give a bit of space between widgets
            Container(
              width: 100,
              height: 100,
              child: Text("Container 2"),
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              child: Text("Container 3"),
              color: Colors.red,
            )
          ],
        )),
      ),
    );
  }
}
