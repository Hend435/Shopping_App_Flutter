import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/AboutApp.dart';
import 'package:flutter_application_1/pages/loginScreen.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // final String? email=FirebaseAuth.instance.currentUser!.email!;
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    getCurrentUserEmail();
  }

  void getCurrentUserEmail() async {
    User user = FirebaseAuth.instance.currentUser!;
    setState(() {
      userEmail = user.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.person,
              size: 70,
              color: Colors.black,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    userEmail,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: const Text("My Orders"),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Favourites"),
              leading: const Icon(Icons.favorite),
              onTap: () {},
            ),
            ListTile(
              title: const Text("About"),
              leading: const Icon(Icons.help_center),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              title: const Text("Logout"),
              leading: const Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => loginscreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
