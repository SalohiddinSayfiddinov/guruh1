import 'dart:convert';

import 'package:guruh1/features/home/models/post.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static const String url = "https://68a9cff5b115e67576ec277d.mockapi.io/users";
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(
        Uri.parse(url),
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
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
        },
        body: jsonEncode(post.toJson()),
      );
      final Map data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Post.fromJson(data as Map<String, dynamic>);
      }
      throw data.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<Post> editPost(Post post) async {
    try {
      final response = await http.put(
        Uri.parse('$url/${post.id}'),
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

  Future<Post> deletePost(String postId) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/$postId'),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
        },
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
