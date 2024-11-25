class Post {
  final String uid;
  final String username;
  final String profilePic;
  final String postId;
  final String postImageUrl;
  final String caption;
  final DateTime createdAt;
  final List<String> likes;
  final List<Comment> comments;

  Post({
    required this.uid,
    required this.username,
    required this.profilePic,
    required this.postId,
    required this.postImageUrl,
    required this.caption,
    required this.createdAt,
    required this.likes,
    required this.comments,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'profilePic': profilePic,
      'postId': postId,
      'postImageUrl': postImageUrl,
      'caption': caption,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'likes': likes,
      'comments': comments.map((comment) => comment.toMap()).toList(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      uid: map['uid'],
      username: map['username'],
      profilePic: map['profilePic'],
      postId: map['postId'],
      postImageUrl: map['postImageUrl'],
      caption: map['caption'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      likes: List<String>.from(map['likes']),
      comments: List<Comment>.from(
          map['comments'].map((comment) => Comment.fromMap(comment))),
    );
  }
}

class Comment {
  final String uid;
  final String username;
  final String profilePic;
  final String commentId;
  final String text;
  final DateTime createdAt;

  Comment({
    required this.uid,
    required this.username,
    required this.profilePic,
    required this.commentId,
    required this.text,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'profilePic': profilePic,
      'commentId': commentId,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      uid: map['uid'],
      username: map['username'],
      profilePic: map['profilePic'],
      commentId: map['commentId'],
      text: map['text'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
