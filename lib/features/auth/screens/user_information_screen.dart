import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/features/auth/controller/auth_controller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();

    if (name.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .saveUserDataToFirebase(context, name, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          Stack(
            children: [
              image == null
                  ? const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?size=626&ext=jpg'),
                      backgroundColor: Colors.deepPurple,
                      radius: 64,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(
                        image!,
                      ),
                      radius: 64,
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.add_a_photo_outlined),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.85,
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
              ),
              IconButton(onPressed: storeUserData, icon: Icon(Icons.done))
            ],
          )
        ],
      ),
    )));
  }
}
