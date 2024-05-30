//import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/Screen/mobile_screen_layout.dart';
import 'package:linkwave/common/repositaries/common_firebase_storage_repositary.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/features/auth/screens/otp_screen.dart';
import 'package:linkwave/features/auth/screens/user_information_screen.dart';
import 'package:linkwave/models/user_models.dart';

final authRepositaryProvider = Provider(
  (ref) => AuthRepositary(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance),
);

class AuthRepositary {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepositary({required this.auth, required this.firestore});

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(
            context,
            OTPScreen.routeName,
            arguments: verificationId,
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?size=626&ext=jpg';

      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepositaryProvider)
            .storeFileToFirebase(
              'profilePic/$uid',
              profilePic,
            );
        var user = UserModel(
            name: name,
            uid: uid,
            profilePic: photoUrl,
            isOnline: true,
            phoneNumber: auth.currentUser!.uid,
            groupId: []);
        await firestore.collection('users').doc(uid).set(user.toMap());

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MobileScreenLayout()),
          (route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
