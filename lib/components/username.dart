import 'package:flutter/material.dart';
import 'package:kdapp/models/api/placeholder_api.dart';
import 'package:kdapp/models/api/user.dart';

class Username extends StatefulWidget {

  final int userId;

  const Username(this.userId, {super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {

  Future<User>? _user;

  @override
  void initState() {
    _user = PlaceholderApi.getUser(widget.userId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _user, 
      builder:(context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const LinearProgressIndicator();
        }

        return Text(snapshot.data?.name ?? "unknown");
      });
  }
}