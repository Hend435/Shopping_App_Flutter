import 'package:flutter/material.dart';

class DevelopersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pink.withOpacity(.5)),
        child: const Text(
          "Developed By :\n\n - Hend Saeed El-Sayed\n\n"
          "- Yomna Hamdi Abd El-Maksoud",
          style: TextStyle(fontSize: 30),
        ),
      )
    ]));
  }
}
