import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/Screen/mobile_chat_screen.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/models/user_models.dart';

final SelectContactRepositaryProvider = Provider(
  (ref) => SelectContactRepositary(firestore: FirebaseFirestore.instance),
);

class SelectContactRepositary {
  final FirebaseFirestore firestore;

  SelectContactRepositary({
    required this.firestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        String selectedPhoneNum =
            selectedContact.phones[0].number.replaceAll(' ', '');

        if (selectedPhoneNum == userData.phoneNumber) {
          isFound = true;
          Navigator.pushNamed(context, MobileChatScreen.routeName);
        }

        if (!isFound) {
          showSnackBar(
              context: context,
              content: 'This number does not exist in our database.');
        }
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
