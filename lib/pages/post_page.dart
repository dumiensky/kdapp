import 'package:flutter/material.dart';
import 'package:kdapp/models/api/comment.dart';
import 'package:kdapp/models/api/placeholder_api.dart';
import 'package:kdapp/models/api/post.dart';

class PostPage extends StatefulWidget {
  final Post post;

  const PostPage(this.post, {super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  Future<List<Comment>>? _comments;

  @override
  void initState() {
    _comments = PlaceholderApi.getPostComments(widget.post.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post: ${widget.post.title}"),
          backgroundColor: Colors.lightBlue,
          leading: BackButton(onPressed: () => Navigator.pop(context)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              color: const Color.fromARGB(250, 230, 230, 230),
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                Text(widget.post.title,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    textAlign: TextAlign.left),
                Text(widget.post.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left),
              ]),
            ),
            const Text("Comments", textAlign: TextAlign.center),
            FutureBuilder(
              future: _comments,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done){
                  return const Center(child: CircularProgressIndicator());
                }
          
                return buildComments(snapshot.data!);
              },)
          ],),
        )
      );
  }
  
  Widget buildComments(List<Comment> comments) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: comments
            .map((comment) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: const Color.fromARGB(250, 240, 240, 240),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(comment.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.left),
                          Text(comment.body,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left),
                        ],
                      )),
                ))
            .toList());
  }
}