import 'package:flutter/material.dart';

class MyLandingScreen extends StatelessWidget {
  const MyLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/mm.jpg'))),
        ),
        Positioned(
          bottom: 20,
          child: ElevatedButton(
              onPressed: () {},
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
              )),
        )
      ]),
    );
  }
}
