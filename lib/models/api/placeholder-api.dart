import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kdapp/models/api/album.dart';
import 'package:kdapp/models/api/comment.dart';
import 'package:kdapp/models/api/photo.dart';
import 'package:kdapp/models/api/post.dart';
import 'package:kdapp/models/api/todo.dart';
import 'package:kdapp/models/api/user.dart';

class PlaceholderApi {
  static const String _base = 'jsonplaceholder.typicode.com';

  static Future<List<Album>> getAlbums() async {
    final url = Uri.https(_base, '/albums');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Album.fromMap(_)).toList();
  }

  static Future<Album> getAlbum(int id) async {
    final url = Uri.https(_base, '/album/$id');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return Album.fromMap(decoded);
  }

   static Future<List<Photo>> getAlbumPhotos(int albumId) async {
    final url = Uri.https(_base, '/albums/$albumId/photos');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Photo.fromMap(_)).toList();
  }

  static Future<List<Photo>> getPhotos() async {
    final url = Uri.https(_base, '/photos');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Photo.fromMap(_)).toList();
  }

  static Future<Photo> getPhoto(int id) async {
    final url = Uri.https(_base, '/photos/$id');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return Photo.fromMap(decoded);
  }

  static Future<List<Post>> getPosts() async {
    final url = Uri.https(_base, '/posts');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Post.fromMap(_)).toList();
  }

  static Future<Post> getPost(int id) async {
    final url = Uri.https(_base, '/posts/$id');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return Post.fromMap(decoded);
  }

  static Future<List<Comment>> getComments() async {
    final url = Uri.https(_base, '/comments');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Comment.fromMap(_)).toList();
  }

  static Future<List<Comment>> getPostComments(int postId) async {
    final url = Uri.https(_base, '/posts/$postId/comments');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Comment.fromMap(_)).toList();
  }

  static Future<List<User>> getUsers() async {
    final url = Uri.https(_base, '/users');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => User.fromMap(_)).toList();
  }

  static Future<User> getUser(int id) async {
    final url = Uri.https(_base, '/users/$id');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return User.fromMap(decoded);
  }

  static Future<List<Album>> getUserAlbums(int userId) async {
    final url = Uri.https(_base, '/users/$userId/albums');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Album.fromMap(_)).toList();
  }

  static Future<List<Post>> getUserPosts(int userId) async {
    final url = Uri.https(_base, '/users/$userId/posts');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Post.fromMap(_)).toList();
  }

  static Future<List<Todo>> getUserTodos(int userId) async {
    final url = Uri.https(_base, '/users/$userId/todos');
    final response = await http.get(url);

    final decoded = json.decode(response.body) as Map<String, dynamic>;
    return (decoded as List).map((_) => Todo.fromMap(_)).toList();
  }
}