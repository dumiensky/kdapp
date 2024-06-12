import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  final int albumId;

  const AlbumPage(this.albumId, {super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}