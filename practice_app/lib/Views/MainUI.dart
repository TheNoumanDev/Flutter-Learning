import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/constants/routes.dart';

enum MenuActions { Logout, Settings }

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home UI"), actions: [
        PopupMenuButton<MenuActions>(
          onSelected: (value) {
            switch (value) {
              case MenuActions.Logout:
                showDialogBox(context).then((value) {
                  if (value) {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginViewRoute, (route) => false);
                  }
                });
                break;
              case MenuActions.Settings:
                // TODO: Handle this case.
                break;
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: MenuActions.Logout,
                child: Text("Logout"),
              ),
              PopupMenuItem(
                value: MenuActions.Settings,
                child: Text("Setting"),
              ),
            ];
          },
        )
      ]),
    );
  }
}

Future<bool> showDialogBox(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Logout")),
        ],
      );
    },
  ).then((value) => value ?? false);
}
