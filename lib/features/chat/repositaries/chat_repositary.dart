import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/models/user_models.dart';

class ChatRepositary{
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepositary({required this.firestore, required this.auth});

  void _saveDataToContactsSubcollection(
    UserModel senderUserData,
    UserModel receiverUserData,
    String text,
    DateTime timeSent,
    String receiverUserId,
  ) async {

  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String receiverUserId,
    required UserModel senderUser,
  }) async {

    try{
      var timeSent = DateTime.now();
      UserModel receiverUserData;

      var userDataMap = await firestore.collection('users').doc(receiverUserId).get();
      receiverUserData = UserModel.fromMap(userDataMap.data()!);

      _saveDataToContactsSubcollection(senderUserData, receiverUserData, text, timeSent, receiverUserId)


    } catch(e) {
      showSnackBar(context: context, content: e.toString());


    }

  }
}