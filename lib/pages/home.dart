import 'package:flutter/material.dart';
import 'package:kdapp/models/api/album.dart';
import 'package:kdapp/models/api/placeholder_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Album>>? _albums;

  @override
  void initState() {
    super.initState();
    _albums = PlaceholderApi.getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Album browser")),
        body: Center(
            child: FutureBuilder<List<Album>>(
                future: _albums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }

                  return Text("loaded ${snapshot.data?.length}");
                })
              )
            );
  }
}
