class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);

  Comment.fromMap(Map<String, dynamic> map)
    : this(
      map['postId'] as int,
      map['id'] as int,
      map['name'] as String,
      map['email'] as String,
      map['body'] as String
    );
}