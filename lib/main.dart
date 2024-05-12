import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkwave/Screen/mobile_screen_layout.dart';
import 'package:linkwave/Screen/web_screen_layout.dart';
import 'package:linkwave/features/landing/my_landing_screen.dart';
import 'package:linkwave/features/landing/screens/landing_screen.dart';
import 'package:linkwave/firebase_options.dart';
import 'package:linkwave/responsive/responsive_layout.dart';
import 'package:linkwave/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      title: 'Link Wave',
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyLandingScreen(),
    );
  }
}
