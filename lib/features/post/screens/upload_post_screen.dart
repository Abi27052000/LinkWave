import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/features/post/controller/post_controller.dart';

class UploadPostScreen extends ConsumerStatefulWidget {
  const UploadPostScreen({Key? key}) : super(key: key);

  @override
  _UploadPostScreenState createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends ConsumerState<UploadPostScreen> {
  XFile? _imageFile;
  final TextEditingController _captionController = TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> _uploadPost() async {
    if (_imageFile == null) {
      showSnackBar(context: context, content: 'Please select an image');
      return;
    }

    String imageUrl = await uploadImageToFirebase(_imageFile!);
    await ref.read(postControllerProvider).uploadPost(
          username: 'Your Username', // Replace with actual username
          profilePic:
              'Your Profile Pic URL', // Replace with actual profile pic URL
          postImageUrl: imageUrl,
          caption: _captionController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Post'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Pick Image'),
          ),
          if (_imageFile != null)
            Image.file(
              File(_imageFile!.path),
              width: 100,
              height: 100,
            ),
          TextField(
            controller: _captionController,
            decoration: const InputDecoration(labelText: 'Caption'),
          ),
          ElevatedButton(
            onPressed: _uploadPost,
            child: const Text('Upload Post'),
          ),
        ],
      ),
    );
  }
}
