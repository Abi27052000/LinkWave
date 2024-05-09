import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkwave/common/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
            'Welcome to LINK-WAVE',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: size.height/9,
          ),
          Image.asset(
            'assets/kk.png',
            height: 340,
            width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: size.height/15,
            ),
            Padding(

              padding: const EdgeInsets.all(20.0),
              child: Text("Read our Privacy Policy. Tap 'Agree and Continue' to process ",
              textAlign:TextAlign.center ,
              ),
            ),
           const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: size.width*0.75,

              child: CustomButton(text: 'AGREE AND CONTINUE', 
              onPressed: () {},
              ),
              ),
            
          ],

        ),
        ),
    );
  }
}