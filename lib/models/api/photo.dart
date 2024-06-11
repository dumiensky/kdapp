class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  Photo.fromMap(Map<String, dynamic> map)
    : this(
      map['albumId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['url'] as String,
      map['thumbnailUrl'] as String
    );
}