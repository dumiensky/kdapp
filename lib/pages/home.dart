import 'package:flutter/material.dart';
import 'package:kdapp/components/username.dart';
import 'package:kdapp/models/api/album.dart';
import 'package:kdapp/models/api/placeholder_api.dart';
import 'package:kdapp/pages/album_page.dart';

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
        appBar: AppBar(
          title: const Text("Album browser"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
            child: FutureBuilder<List<Album>>(
                future: _albums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }

                  return buildAlbums(snapshot.data!);
                })));
  }

  Widget buildAlbums(List<Album> albums) {
    return ListView(
      children: albums
        .map((album) => 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => 
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (c) => AlbumPage(album.id))), 
              child: Padding(
                padding: const EdgeInsets.all(10), 
                child: Column(
                  children: <Widget>[
                    Text(
                      album.title, 
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,), 
                    Username(album.userId)],
                ))),
          ))
        .toList());
  }
}
