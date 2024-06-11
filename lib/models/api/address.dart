import 'package:kdapp/models/api/geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Geo geo;

  Address(this.street, this.suite, this.city, this.zipCode, this.geo);
}