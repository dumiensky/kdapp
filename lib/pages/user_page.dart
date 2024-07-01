import 'package:flutter/material.dart';
import 'package:kdapp/models/api/album.dart';
import 'package:kdapp/models/api/placeholder_api.dart';
import 'package:kdapp/models/api/post.dart';
import 'package:kdapp/models/api/todo.dart';
import 'package:kdapp/models/api/user.dart';
import 'package:kdapp/pages/album_page.dart';
import 'package:kdapp/pages/post_page.dart';

class UserPage extends StatefulWidget {
  final User user;

  const UserPage(this.user, {super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<List<Album>>? _albums;
  Future<List<Post>>? _posts;
  Future<List<Todo>>? _todos;

  @override
  void initState() {
    _albums = PlaceholderApi.getUserAlbums(widget.user.id);
    _posts = PlaceholderApi.getUserPosts(widget.user.id);
    _todos = PlaceholderApi.getUserTodos(widget.user.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User: ${widget.user.name}"),
          backgroundColor: Colors.lightBlue,
          leading: BackButton(onPressed: () => Navigator.pop(context)),
        ),
        body: ListView(children: [
          FutureBuilder<List<Album>>(
              future: _albums,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    Text(
                      "Albums",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    buildAlbums(snapshot.data!)
                  ],
                );
              }),
          FutureBuilder<List<Post>>(
              future: _posts,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    Text(
                      "Posts",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    buildPosts(snapshot.data!)
                  ],
                );
              }),
          FutureBuilder<List<Todo>>(
              future: _todos,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    Text(
                      "Todos",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    buildTodos(snapshot.data!)
                  ],
                );
              }),
        ]));
  }

  Widget buildAlbums(List<Album> albums) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: albums
            .map((album) => Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (c) => AlbumPage(album))),
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(album.title,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center))),
                ))
            .toList());
  }

  Widget buildPosts(List<Post> posts) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: posts
            .map((post) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: const Color.fromARGB(250, 230, 230, 230),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.title,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                              textAlign: TextAlign.left),
                          Text(post.body,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left),
                          TextButton(
                            onPressed: () => 
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (c) => PostPage(post))), 
                            child: const Text("details..."))
                        ],
                      )),
                ))
            .toList());
  }

  Widget buildTodos(List<Todo> todos) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: todos
            .map((todo) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: const Color.fromARGB(230, 250, 230, 230),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(todo.title,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                              textAlign: TextAlign.left),
                          getTodoStateText(todo)
                        ],
                      )),
                ))
            .toList());
  }

  Widget getTodoStateText(Todo todo) {
    if (todo.completed) {
      return const Text("COMPLETED", style: TextStyle(color: Colors.green));
    }

    return const Text("IN PROGRESS");
  }
}