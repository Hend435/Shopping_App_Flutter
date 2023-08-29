import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        image: Center(
          child: Image.asset(
            "assets/images/intro1.webp",
            fit: BoxFit.cover,
          ),
        ),
        title: "Your Infinite Wardrobe",
        body: 'Discover what works best for you',
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        image: Center(
          child: Image.asset(
            "assets/images/intro22.webp",
            fit: BoxFit.cover,
          ),
        ),
        title: "Your Style, Your Way",
        body: 'Create your unique style and look amazing everyday',
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        image: Center(
            child: Image.asset("assets/images/intro33.jpg", fit: BoxFit.cover)),
        title: "Discover A New You ",
        body: 'Keep chic and try on',
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Colors.pink,
          activeSize: Size.square(15),
          activeColor: Colors.pink,
        ),
        showDoneButton: true,
        done: const Text('Get Started',
            style: TextStyle(fontSize: 20, color: Colors.pink)),
        showSkipButton: true,
        skip: const Text('Skip',
            style: TextStyle(fontSize: 20, color: Colors.pink)),
        showNextButton: true,
        next: const Text('Next',
            style: TextStyle(fontSize: 20, color: Colors.pink)),
        onDone: () => onDone(context),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => loginscreen()));
  }
}
