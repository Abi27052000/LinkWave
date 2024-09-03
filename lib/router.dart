import 'dart:io';

import 'package:flutter/material.dart';
import 'package:linkwave/features/chat/Screens/mobile_chat_screen.dart';
import 'package:linkwave/common/widgets/error.dart';
import 'package:linkwave/features/auth/screens/login_screen.dart';
import 'package:linkwave/features/auth/screens/otp_screen.dart';
import 'package:linkwave/features/auth/screens/user_information_screen.dart';
import 'package:linkwave/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:linkwave/features/status/screens/confirm_status_screen.dart';
import 'package:linkwave/features/status/screens/status_screen.dart';
import 'package:linkwave/models/status_model.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );

    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );
    case SelectContactScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactScreen(),
      );

    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      return MaterialPageRoute(
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
        ),
      );
    case ConfirmStatusScreen.routeName:
      final file = settings.arguments as File;
      return MaterialPageRoute(
        builder: (context) => ConfirmStatusScreen(
          file: file,
        ),
      );
    case StatusScreen.routeName:
      final status = settings.arguments as Status;
      return MaterialPageRoute(
        builder: (context) => StatusScreen(
          status: status,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: ErrorScreen(error: 'This page doesnt exist'),
        ),
      );
  }
}
