import 'package:flutter/material.dart';
import 'package:kdapp/pages/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api consumer',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: const Home(),
    );
  }
}