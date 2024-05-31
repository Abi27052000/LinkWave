import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/features/select_contacts/repositary/select_contact_repositary.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectContactRepositary = ref.watch(SelectContactRepositaryProvider);
  return selectContactRepositary.getContacts();
});

final selectContactControllerProvider = Provider((ref) {
  final selectContactRepositary = ref.watch(SelectContactRepositaryProvider);
  return SelectContactController(
      ref: ref, selectContactRepositary: selectContactRepositary);
});

class SelectContactController {
  final ProviderRef ref;
  final SelectContactRepositary selectContactRepositary;

  SelectContactController(
      {required this.ref, required this.selectContactRepositary});

  void selectContact(Contact selectedContact, BuildContext context) {
    selectContactRepositary.selectContact(selectedContact, context);
  }
}
