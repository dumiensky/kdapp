import 'package:flutter/material.dart';
import 'package:kdapp/models/api/post.dart';

class PostPage extends StatefulWidget {
  final Post post;

  const PostPage(this.post, {super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post: ${widget.post.title}"),
          backgroundColor: Colors.lightBlue,
          leading: BackButton(onPressed: () => Navigator.pop(context)),
        ),
        body: Placeholder()
        );
  }
}