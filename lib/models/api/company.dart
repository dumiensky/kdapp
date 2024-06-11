class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company(this.name, this.catchPhrase, this.bs);

  Company.fromMap(Map<String, dynamic> map)
    : this(
      map['name'] as String,
      map['catchPhrase'] as String,
      map['bs'] as String
    );
}