import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/features/auth/controller/auth_controller.dart';
import 'package:linkwave/features/status/repositary/status_repositary.dart';
import 'package:linkwave/models/status_model.dart';

final statusControllerProvider = Provider((ref) {
  final statusRepositary = ref.read(StatusRepositaryProvider);
  return StatusController(
    statusRepositary: statusRepositary,
    ref: ref,
  );
});

class StatusController {
  final StatusRepositary statusRepositary;
  final ProviderRef ref;

  StatusController({
    required this.statusRepositary,
    required this.ref,
  });

  void addStatus(File file, BuildContext context) {
    ref.watch(userDataAuthProvider).whenData((value) {
      statusRepositary.uploadStatus(
        username: value!.name,
        profilePic: value.profilePic,
        phoneNumber: value.phoneNumber,
        statusImage: file,
        context: context,
      );
    });
  }

  Future<List<Status>> getStatus(BuildContext context) async {
    List<Status> statuses = await statusRepositary.getStatus(context);
    return statuses;
  }
}
