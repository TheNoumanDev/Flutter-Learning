import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/Views/Login_View.dart';

// Below Here is teh Class defined and stored in the file.

class Info {
  IconData icon;
  String title;
  String subtitle;

  Info({required this.icon, required this.title, required this.subtitle});
}

class ProfileScreen extends StatelessWidget {
  final String username;
  final String title;
  final String? imageUrl;
  final List<Info> info;

  // Below is the constructor defined with require and optional parameters.
  const ProfileScreen({
    super.key,
    required this.username,
    required this.title,
    this.imageUrl,
    required this.info,
  });

  // Below is the function defined with require and optional parameters. and cann be called with named parameters.
  void printUserInfo({
    required String username,
    String? email,
    String? phone,
  }) {
    print('Username: $username');
    if (email != null) {
      print('Email: $email');
    }
    if (phone != null) {
      print('Phone: $phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          HeaderSection(
            username: username,
            title: title,
            backgroundColor: Colors.green,
          ),
          const SizedBox(height: 20),
          ProfilePictureSection(imageUrl: imageUrl),
          const SizedBox(height: 20),
          Expanded(child: InfoSection(info: info)),
          // make a logout button to logout the current firebase user and move back to login screen
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginView()));
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final String username;
  final String title;
  final Color backgroundColor;

  const HeaderSection({
    super.key,
    required this.username,
    required this.title,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Text(
            username,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

// this widget take optional parameter of image
class ProfilePictureSection extends StatelessWidget {
  final String? imageUrl;

  const ProfilePictureSection({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? const Icon(Icons.person, size: 50) : null,
    );
  }
}

class InfoSection extends StatelessWidget {
  final List<Info> info;

  const InfoSection({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: info
          .map((i) => ListTile(
                leading: Icon(i.icon),
                title: Text(i.title),
                subtitle: Text(i.subtitle),
              ))
          .toList(),
    );
  }
}
