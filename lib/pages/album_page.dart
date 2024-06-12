import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kdapp/components/username.dart';
import 'package:kdapp/models/api/album.dart';
import 'package:kdapp/models/api/photo.dart';
import 'package:kdapp/models/api/placeholder_api.dart';
import 'package:kdapp/pages/user_page.dart';

class AlbumPage extends StatefulWidget {
  final Album album;

  const AlbumPage(this.album, {super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

  Future<List<Photo>>? _photos;

  @override
  void initState() {
    _photos = PlaceholderApi.getAlbumPhotos(widget.album.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Album: ${widget.album.title}"),
          backgroundColor: Colors.lightBlue,
          leading: BackButton(onPressed: () => Navigator.pop(context)),
        ),
        body: FutureBuilder<List<Photo>>(
            future: _photos,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
              }
        
              return buildPhotos(snapshot.data!);
            }),
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Username(widget.album.userId),
          ),
          onPressed: () => navigateToUser(context, widget.album.userId)),
        );
  }

  void navigateToUser(BuildContext context, int userId) {
    PlaceholderApi.getUser(userId).then((u) => Navigator.push(
          context, 
          MaterialPageRoute(builder: (c) => UserPage(u))));
  }
  
  Widget buildPhotos(List<Photo> photos) {
    return SingleChildScrollView(
      child: Column(
        children: photos
          .map((photo) => 
            Container(
              color: Theme.of(context).primaryColorLight,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                    children: <Widget>[
                      CachedNetworkImage(
                          imageUrl: photo.url,
                          placeholder: (context, url) => const SizedBox(
                            height: 400,
                            child: Center(
                              child: CircularProgressIndicator(),
                            )),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Text(
                        photo.title, 
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,)
                      ],
                  ),
            ))
          .toList()),
    );
  }
}