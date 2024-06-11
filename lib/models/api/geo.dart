class Geo {
  final String lat;
  final String lng;

  Geo(this.lat, this.lng);

  Geo.fromMap(Map<String, dynamic> map) 
    : this(
      map['lat'] as String,
      map['lng'] as String
    );
}