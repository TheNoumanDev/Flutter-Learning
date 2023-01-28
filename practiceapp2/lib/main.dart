import 'package:flutter/material.dart';

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
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables
  late final TextEditingController _email;

  late final TextEditingController _password;

  // We need to initilize the texteditingcontroller in the initstate and also
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        /*
       FutureBuilder is used to build the widget when the future is completed
       so we call the firebase.initializeApp method to initialize the firebase before
       creating the widgets and in builder we can implement things according to the 
       state of future such as while loading we can put the loading window and when
       it is completed we returned the column widget!
       */
        body: Column(
          children: [
            TextField(
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: ("Enter your email"),
              ),
              controller: _email,
            ),

            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: ("Enter your password"),
              ),
              controller: _password,
            ),

            TextButton(
              onPressed: () async {
                // try {
                //   final email = _email.text;
                //   final password = _password.text;
                //   final userCredential = await FirebaseAuth.instance
                //       .signInWithEmailAndPassword(email: email, password: password);
                // } on FirebaseAuthException catch (e) {
                //   // you can check the exception type by e.runtimeType
                //   // and then to catch this specific exception you can use
                //   // on keyword with type behind catch keyword and then
                //   // use the e.code method to check the error code adn implement
                //   // the code accordingly.
                //   if (e.code == "user-not-found") {
                //     print("No user found for that email");
                //   } else if (e.code == "wrong-password") {
                //     print("Wrong password provided for that user");
                //   }
                // }
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.green,
                elevation: 5,
              ),
              onPressed: null,
              child: const Text('Disabled'),
            ),
            // implement container
            Row(
              // verticalDirection:
              //     VerticalDirection.down, // to set where the  widgets starts from
              //mainAxisAlignment: MainAxisAlignment
              //   .spaceEvenly, // to defin where the widgets can be stored
              //crossAxisAlignment:
              //    CrossAxisAlignment.stretch, // to align along horizontal
              children: [
                Container(
                  width: 100,
                  height: 60,
                  margin: EdgeInsets.all(10),
                  child: Text('Container 1'),
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 30,
                ), // to give a bit of space between widgets
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 0, top: 40, bottom: 0),
                  child: Text("Container 2"),
                  color: Colors.yellow,
                ),
                Container(
                  width: 100,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: Text("Container 3"),
                  color: Colors.red,
                )
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
                width: 100,
                padding: const EdgeInsets.only(
                    left: 10.0, right: 0, top: 80, bottom: 0),
                child: Text("Expanded"),
              ),
            ),
            //implement a icon button
            Center(
              child: IconButton(
                iconSize: 100,
                icon: const Icon(
                  Icons.add,
                ),
                // the color of the button when it is pressed
                color: Colors.black,
                hoverColor: Colors.red,
                // the method which is called
                // when button is pressed

                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  // final UserCredential = await FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: email, password: password);
                },
              ),
            ),
          ],
        ));
  }
}
