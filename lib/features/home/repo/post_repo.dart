import 'dart:convert';

import 'package:guruh1/features/home/models/post.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {'Accept': 'application/json'},
      );
      final List data = jsonDecode(response.body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw data.toString();
      }
      return data.map((e) => Post.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Post> createPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
        },
        body: jsonEncode(post.toJson()),
      );
      final Map data = jsonDecode(response.body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw data.toString();
      }
      return Post.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
