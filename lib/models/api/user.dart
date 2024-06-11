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
}