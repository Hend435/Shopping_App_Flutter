import 'package:flutter/material.dart';

class GirlsClothingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            margin: EdgeInsets.all(30),
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.pink.withOpacity(.5)),
            alignment: Alignment.center,
            child: const Text(
              "This app is about women fashion ALL in one Formal & Soriee & Casual ",
              style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
            ))
      ],
    ));
  }
}
