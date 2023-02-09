// ignore_for_file: file_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/Views/UpdateRecordAPI.dart';
import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'package:practice_app/constants/routes.dart';

String stringRep = "";
List mapRep = [];

enum MenuActions { Accounts, Forget }

class APIView extends StatefulWidget {
  const APIView({super.key});

  @override
  State<APIView> createState() => _APIViewState();
}

Query fb = FirebaseDatabase.instance.ref().child('users');
DatabaseReference reference = FirebaseDatabase.instance.ref().child('Students');
String _data = "";

class _APIViewState extends State<APIView> {
  Future apiCall() async {
    //final ref = fb.ref().child('users');

    // ref.once().then((DataSnapshot snapshot) {
    //       // setState(() {
    //       devtools.log("Data: ${snapshot.value}");
    //       //  _value  = snapshot.value;
    //       // });
    //     } as FutureOr Function(DatabaseEvent value));

    //   // http.Response response = await http
    //   //     .get(Uri.parse("https://pcc.edu.pk/ws/bscs2020/services.php"));
    //   // if (response.statusCode == 200) {
    //   //   setState(() {
    //   //     // stringRep = response.body;

    //   //     mapRep = json.decode(response.body);
    //   //   });
    //   // }
  }

  // _getData() {
  //   // ignore: deprecated_member_use
  //   final databaseReference = FirebaseDatabase.instance.reference();

  //   databaseReference.child("users").once().then((DataSnapshot snapshot) {
  //         setState(() {
  //           _data = snapshot.value;
  //         });
  //       } as FutureOr Function(DatabaseEvent value));
  // }

  @override
  void initState() {
    apiCall();
    //_getData();
    super.initState();
  }

  Widget listItem({required Map Students}) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            // wrap below Text widget with textrich widget to make it bold
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: "Title: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                  text: Students["title"],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              ]),
            ),
          ]),
          Row(children: [
            // wrap below Text widget with textrich widget to make it bold
            Expanded(
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Description: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(
                      text: Students["description"],
                      style: const TextStyle(color: Colors.black))
                ]),
              ),
            ),
          ]),
          Row(children: [
            // wrap below Text widget with textrich widget to make it bold
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: "Status: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: Students["status"],
                    style: const TextStyle(color: Colors.black))
              ]),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                UpdateRecord(studentKey: Students['key'])));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 25.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                GestureDetector(
                  onTap: () {
                    reference.child(Students['key']).remove();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 25.0,
                        color: Colors.red[700],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Calls Result"), actions: [
        PopupMenuButton<MenuActions>(
          onSelected: (value) {
            if (value.toString() == "MenuActions.Accounts") {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(APIViewRoute, (route) => false);
            } else if (value.toString() == "MenuActions.Forget") {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(ForgetViewRoute, (route) => false);
            }
            devtools.log(value.toString());
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: MenuActions.Accounts,
                child: Text("Accounts"),
              ),
              PopupMenuItem(
                value: MenuActions.Forget,
                child: Text("Forget"),
              ),
            ];
          },
        )
      ]),
      body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: fb,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map Students = snapshot.value as Map;
              Students['key'] = snapshot.key;

              return listItem(Students: Students);
            },
          )
          //   child: mapRep == null
          //       ? const Text("Data is loading")
          //       : ListView.builder(
          //           itemCount: mapRep.length,
          //           itemBuilder: (context, index) {
          //             return Container(
          //               padding: const EdgeInsets.only(left: 10.0, top: 5.0),
          //               margin: const EdgeInsets.only(top: 10.0),
          //               decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.black),
          //                 borderRadius: BorderRadius.circular(10.0),
          //               ),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Row(children: [
          //                     // wrap below Text widget with textrich widget to make it bold
          //                     RichText(
          //                       text: TextSpan(children: [
          //                         TextSpan(
          //                             text: "Title: ",
          //                             style: const TextStyle(
          //                                 fontWeight: FontWeight.bold,
          //                                 color: Colors.black)),
          //                         TextSpan(
          //                           text: mapRep[index]["title"],
          //                           style: const TextStyle(
          //                             color: Colors.black,
          //                           ),
          //                         )
          //                       ]),
          //                     ),
          //                   ]),
          //                   Row(children: [
          //                     // wrap below Text widget with textrich widget to make it bold
          //                     Expanded(
          //                       child: RichText(
          //                         text: TextSpan(children: [
          //                           TextSpan(
          //                               text: "Description: ",
          //                               style: const TextStyle(
          //                                   fontWeight: FontWeight.bold,
          //                                   color: Colors.black)),
          //                           TextSpan(
          //                               text: mapRep[index]["description"],
          //                               style: const TextStyle(color: Colors.black))
          //                         ]),
          //                       ),
          //                     ),
          //                   ]),
          //                   Row(children: [
          //                     // wrap below Text widget with textrich widget to make it bold
          //                     RichText(
          //                       text: TextSpan(children: [
          //                         TextSpan(
          //                             text: "Status: ",
          //                             style: const TextStyle(
          //                                 fontWeight: FontWeight.bold,
          //                                 color: Colors.black)),
          //                         TextSpan(
          //                             text: mapRep[index]["status"],
          //                             style: const TextStyle(color: Colors.black))
          //                       ]),
          //                     ),
          //                   ]),
          //                 ],
          //               ),
          //             );
          //           },
          //         ),
          ),
    );
  }
}

// child: mapRep == null
//             ? Text("Data is loading")
//             : Text(mapRep.toString()),
