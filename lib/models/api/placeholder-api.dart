import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kdapp/models/api/album.dart';

class PlaceholderApi {

  static const String _base = 'jsonplaceholder.typicode.com';

  static Future<List<Album>> getAlbums() async {
    final url = Uri.https(_base, '/albums');
    final response = await http.get(url);

    final packageJson = json.decode(response.body) as Map<String, dynamic>;

    return PackageInfo.fromJson(packageJson);
  }
}