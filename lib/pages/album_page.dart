import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kdapp/models/api/album.dart';
import 'package:kdapp/models/api/photo.dart';
import 'package:kdapp/models/api/placeholder_api.dart';

class AlbumPage extends StatefulWidget {
  final Album album;

  const AlbumPage(this.album, {super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

  Future<List<Photo>>? _album;

  @override
  void initState() {
    _album = PlaceholderApi.getAlbumPhotos(widget.album.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.album.title),
          backgroundColor: Colors.lightBlue,
          leading: BackButton(onPressed: () => Navigator.pop(context)),
        ),
        body: Center(
            child: FutureBuilder<List<Photo>>(
                future: _album,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }

                  return buildPhotos(snapshot.data!);
                })));
  }
  
  Widget buildPhotos(List<Photo> photos) {
    return ListView(
      children: photos
        .map((photo) => 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  children: <Widget>[
                    CachedNetworkImage(
                        imageUrl: photo.url,
                        placeholder: (context, url) => const SizedBox(
                          height: 300,
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
        .toList());
  }
}