// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkwave/features/auth/repositary/auth_repositary.dart';
import 'package:linkwave/models/user_models.dart';

final authControllerProvider = Provider((ref) {
  final authRepositary = ref.watch(authRepositaryProvider);
  return AuthController(authRepositary: authRepositary, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepositary authRepositary;
  final ProviderRef ref;
  AuthController({
    required this.authRepositary,
    required this.ref,
  });

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepositary.getCurrentUserData();
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepositary.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepositary.verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepositary.saveUserDataToFirebase(
        name: name, profilePic: profilePic, ref: ref, context: context);
  }
}
