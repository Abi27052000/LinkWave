import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/features/post/controller/post_controller.dart';

import 'package:linkwave/common/widgets/loader.dart';
import 'package:linkwave/models/posting.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postFuture = ref.watch(postControllerProvider).getPosts(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Posts Found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var post = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.profilePic),
                ),
                title: Text(post.username),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.caption),
                    Image.network(post.postImageUrl),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            // post.likes.contains(ref.read(authProvider).currentUser!.uid)
                            // ? Icons.favorite
                            // :
                            Icons.favorite_border,
                          ),
                          onPressed: () {
                            // ref.read(postControllerProvider).likePost(post.postId, ref.read(authProvider).currentUser!.uid);
                          },
                        ),
                        Text('${post.likes.length} likes'),
                      ],
                    ),
                    ...post.comments.map((comment) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(comment.profilePic),
                          ),
                          title: Text(comment.username),
                          subtitle: Text(comment.text),
                        )),
                  ],
                ),
                onTap: () {
                  // Navigate to post detail screen
                },
              );
            },
          );
        },
      ),
    );
  }
}
