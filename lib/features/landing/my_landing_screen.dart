import 'package:flutter/material.dart';
import 'package:linkwave/features/auth/screens/login_screen.dart';

class MyLandingScreen extends StatelessWidget {
  const MyLandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/new.jpg'))),
        ),
        Positioned(
          bottom: 20,
          child: ElevatedButton(
            onPressed: () {
              return navigateToLoginScreen(context);
            },
            child: Text(
              'AGREE AND CONTINUE',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(MediaQuery.of(context).size.width, 70),
            ),
          ),
        )
      ]),
    );
  }
}
