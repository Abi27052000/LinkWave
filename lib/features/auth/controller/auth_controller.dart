// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/features/auth/repositary/auth_repositary.dart';

final authControllerProvider = Provider((ref) {
  final authRepositary = ref.watch(authRepositaryProvider);
  return AuthController(authRepositary: authRepositary);
});

class AuthController {
  final AuthRepositary authRepositary;
  AuthController({
    required this.authRepositary,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepositary.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepositary.verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }
}
