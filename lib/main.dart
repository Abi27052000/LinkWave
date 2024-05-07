import 'package:flutter/material.dart';
import 'package:linkwave/Screen/mobile_screen_layout.dart';
import 'package:linkwave/Screen/web_screen_layout.dart';
import 'package:linkwave/responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        
      ),
      title: 'Link Wave',
      home:const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(), webScreenLayout: WebScreenLayout()),
      
        
      );
      
    
  }
}

