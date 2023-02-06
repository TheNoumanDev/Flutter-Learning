import 'package:flutter/material.dart';
import 'Views/ProfileCard.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Icon(
                  Icons.account_box,
                  color: Colors.brown[300],
                  size: 50,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Accounts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Add another account - so you can switch between them easily.",
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                const Text(
                  "Your existing account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  "Manage account",
                  style: TextStyle(
                    color: Colors.brown[300],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: const [
                ProfileCard(
                  name: "John Doe",
                  email: "johndoe@gmail.com",
                  icon: Icons.person,
                  right: Icon(Icons.check),
                ),
                ProfileCard(
                  name: "Jane Doe",
                  email: "janedoe@gmail.com",
                  icon: Icons.person,
                  right: Text("5"),
                ),
                ProfileCard(
                  name: "Jim Doe",
                  email: "jimdoe@gmail.com",
                  icon: Icons.person,
                  right: Text("10"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
