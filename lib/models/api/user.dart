import 'package:kdapp/models/api/address.dart';
import 'package:kdapp/models/api/company.dart';

class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(this.id, this.name, this.userName, this.email, this.address, this.phone, this.website, this.company);

  User.fromMap(Map<String, dynamic> map)
    : this (
      map['id'] as int,
      map['name'] as String,
      map['username'] as String,
      map['email'] as String,
      Address.fromMap(map['address']),
      map['phone'] as String,
      map['website'] as String,
      Company.fromMap(map['company'])
    );
}