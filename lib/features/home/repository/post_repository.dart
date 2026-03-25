import 'dart:convert';

import 'package:guruh1/features/home/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Post>> getPosts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {"Accept": "application/json"},
    );
    final List malumot = jsonDecode(response.body);
    final List<Post> posts = malumot
        .map((temp) => Post.fromJson(temp))
        .toList();

    return posts;
  }
}
