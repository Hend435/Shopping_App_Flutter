import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Casualpage.dart';
import 'package:flutter_application_1/pages/soriee.dart';
import 'formalpage.dart';

class Category extends StatelessWidget {
  const Category({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topLeft,
                  child: const Icon(Icons.arrow_back))
              
              ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                    image: AssetImage("assets/images/golddress.webp"),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SorieeScreen()));
                },
                child: const Text(
                  "Soriee",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                    image: AssetImage("assets/images/111.jpg"),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const formalScreen()));
                },
                child: const Text(
                  "Formal",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              //color: Colors.green,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                    image: AssetImage("assets/images/casual.jpg"),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center),
              ),

              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CasualScreen()));
                },
                child: const Text(
                  "Casual",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
