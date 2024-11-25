import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:linkwave/features/post/repositary/post_repositary.dart';
import 'package:linkwave/models/posting.dart';

final postControllerProvider = Provider((ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return PostController(postRepository: postRepository, ref: ref);
});

class PostController {
  final PostRepository postRepository;
  final ProviderRef ref;

  PostController({
    required this.postRepository,
    required this.ref,
  });

  Future<void> uploadPost({
    required String username,
    required String profilePic,
    required String postImageUrl,
    required String caption,
    required BuildContext context,
  }) async {
    await postRepository.uploadPost(
      username: username,
      profilePic: profilePic,
      postImageUrl: postImageUrl,
      caption: caption,
      context: context,
    );
  }

  Future<List<Post>> getPosts(BuildContext context) async {
    return await postRepository.getPosts(context);
  }

  Future<void> likePost(String postId, String uid) async {
    await postRepository.likePost(postId, uid);
  }

  Future<void> addComment(String postId, Comment comment) async {
    await postRepository.addComment(postId, comment);
  }
}
