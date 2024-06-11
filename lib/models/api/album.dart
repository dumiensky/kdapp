class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);

  Album.fromMap(Map<String, dynamic> map) 
    : this(
        map['userId'] as int,
        map['id'] as int,
        map['title'] as String,
      );
}