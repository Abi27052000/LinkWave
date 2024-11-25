import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/models/posting.dart';
import 'package:uuid/uuid.dart';

final postRepositoryProvider = Provider((ref) => PostRepository(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
      ref: ref,
    ));

class PostRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final ProviderRef ref;

  PostRepository({
    required this.firestore,
    required this.auth,
    required this.ref,
  });

  Future<void> uploadPost({
    required String username,
    required String profilePic,
    required String postImageUrl,
    required String caption,
    required BuildContext context,
  }) async {
    try {
      var postId = const Uuid().v1();
      Post post = Post(
        uid: auth.currentUser!.uid,
        username: username,
        profilePic: profilePic,
        postId: postId,
        postImageUrl: postImageUrl,
        caption: caption,
        createdAt: DateTime.now(),
        likes: [],
        comments: [],
      );

      await firestore.collection('posts').doc(postId).set(post.toMap());
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Future<List<Post>> getPosts(BuildContext context) async {
    List<Post> postData = [];
    try {
      var postsSnapshot = await firestore
          .collection('posts')
          .orderBy('createdAt', descending: true)
          .get();
      for (var tempData in postsSnapshot.docs) {
        Post tempPost = Post.fromMap(tempData.data());
        postData.add(tempPost);
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
    return postData;
  }

  Future<void> likePost(String postId, String uid) async {
    try {
      var postDoc = firestore.collection('posts').doc(postId);
      var postSnapshot = await postDoc.get();
      if (postSnapshot.exists) {
        List<String> likes = List<String>.from(postSnapshot.data()!['likes']);
        if (likes.contains(uid)) {
          likes.remove(uid);
        } else {
          likes.add(uid);
        }
        await postDoc.update({'likes': likes});
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addComment(String postId, Comment comment) async {
    try {
      var postDoc = firestore.collection('posts').doc(postId);
      var postSnapshot = await postDoc.get();
      if (postSnapshot.exists) {
        List<Comment> comments = List<Comment>.from(postSnapshot
            .data()!['comments']
            .map((comment) => Comment.fromMap(comment)));
        comments.add(comment);
        await postDoc.update(
            {'comments': comments.map((comment) => comment.toMap()).toList()});
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
