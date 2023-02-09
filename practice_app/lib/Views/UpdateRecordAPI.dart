import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {
  const UpdateRecord({Key? key, required this.studentKey}) : super(key: key);

  final String studentKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final statusController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentKey).get();

    Map student = snapshot.value as Map;
    //String a = '${widget.studentKey}/title';
    print(student['title']);
    print("asdasda");
    titleController.text = student['title'];
    descriptionController.text = student['description'];
    statusController.text = student['status'];
  }

  Widget ShowUpdateDialog(
    BuildContext context,
  ) {
    return SimpleDialog(
      title: const Center(
        child: Text('Updating record'),
      ),
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: descriptionController,
                maxLines: null,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  //hintText: 'Enter Your Age',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: statusController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Status',
                  //hintText: 'Enter Your Salary',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: MaterialButton(
                onPressed: () {
                  Map<String, String> students = {
                    'title': titleController.text,
                    'description': descriptionController.text,
                    'status': statusController.text
                  };

                  dbRef
                      .child(widget.studentKey)
                      .update(students)
                      .then((value) => {Navigator.pop(context)});
                },
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
                child: const Text('Update Data'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShowUpdateDialog(context);
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Updating record'),
    //   ),
    //   body: Center(
    //     child: Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           const SizedBox(
    //             height: 50,
    //           ),
    //           const Text(
    //             'Updating data in Firebase Realtime Database',
    //             style: TextStyle(
    //               fontSize: 24,
    //               fontWeight: FontWeight.w500,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           TextField(
    //             controller: titleController,
    //             keyboardType: TextInputType.text,
    //             decoration: const InputDecoration(
    //               border: OutlineInputBorder(),
    //               labelText: 'Title',
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           TextField(
    //             controller: descriptionController,
    //             keyboardType: TextInputType.text,
    //             decoration: const InputDecoration(
    //               border: OutlineInputBorder(),
    //               labelText: 'Description',
    //               //hintText: 'Enter Your Age',
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           TextField(
    //             controller: statusController,
    //             keyboardType: TextInputType.text,
    //             decoration: const InputDecoration(
    //               border: OutlineInputBorder(),
    //               labelText: 'Status',
    //               //hintText: 'Enter Your Salary',
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           MaterialButton(
    //             onPressed: () {
    //               Map<String, String> students = {
    //                 'name': titleController.text,
    //                 'age': descriptionController.text,
    //                 'salary': statusController.text
    //               };

    //               dbRef
    //                   .child(widget.studentKey)
    //                   .update(students)
    //                   .then((value) => {Navigator.pop(context)});
    //             },
    //             child: const Text('Update Data'),
    //             color: Colors.blue,
    //             textColor: Colors.white,
    //             minWidth: 300,
    //             height: 40,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
