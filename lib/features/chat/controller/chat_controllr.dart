//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/features/auth/controller/auth_controller.dart';
import 'package:linkwave/features/chat/repositaries/chat_repositary.dart';

final ChatControllerProvider = Provider((ref) {
  final ChatRepositary = ref.watch(ChatRepositaryProvider);
  return ChatController(
    chatRepositary: ChatRepositary,
    ref: ref,
  );
});

class ChatController {
  final ChatRepositary chatRepositary;
  final ProviderRef ref;

  ChatController({required this.chatRepositary, required this.ref});

  void sendTextMessage(
      BuildContext context, String text, String receiverUserId) {
    ref.read(userDataAuthProvider).whenData((value) {
      chatRepositary.sendTextMessage(
        context: context,
        text: text,
        receiverUserId: receiverUserId,
        senderUser: value!,
      );
    });
  }
}
