import 'package:kdapp/models/api/geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Geo geo;

  Address(this.street, this.suite, this.city, this.zipCode, this.geo);

  Address.fromMap(Map<String, dynamic> map)
    : this(
      map['street'] as String,
      map['suite'] as String,
      map['city'] as String,
      map['zipCode'] as String,
      Geo.fromMap(map['geo'])
    );
}