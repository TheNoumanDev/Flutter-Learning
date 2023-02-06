import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ProfileCard.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

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
                  Icons.account_circle,
                  color: Colors.orange[200],
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
                color: Colors.grey[500],
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
                    color: Colors.orange[200],
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
                  name: "Panji Paradana",
                  email: "panjiperdana@gmail.com",
                  icon: Icons.person_2_rounded,
                  right: Icon(Icons.check_circle_rounded, color: Colors.blue),
                ),
                const SizedBox(height: 15.0),
                ProfileCard(
                  name: "Sulistyo Ali",
                  email: "slistyoAli@gmail.com",
                  icon: Icons.person_3_outlined,
                  right: Text("   5"),
                ),
                const SizedBox(height: 15.0),
                ProfileCard(
                  name: "Astaru Lopez",
                  email: "AsPez@gmail.com",
                  icon: Icons.person_4_sharp,
                  right: Text("  10"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: 330,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: const Text(
                "Add Another Account +",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const SizedBox(width: 80.0),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/ForgetView', (route) => false);
                },
                child: const Text(
                  "Forget Page",
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
    );
  }
}
