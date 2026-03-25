import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  final String userId;

  const SecondPage({super.key, required this.userId});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<Map> _getUser() async {
    final response = await http.get(
      Uri.parse(
        'https://68a9cff5b115e67576ec277d.mockapi.io/users/${widget.userId}',
      ),
      headers: {'Accept': 'application/json'},
    );
    final data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.userId)),
      body: FutureBuilder(
        future: _getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final user = snapshot.data!;
          return Center(
            child: Column(
              spacing: 10.0,
              children: [
                CachedNetworkImage(
                  imageUrl: user['image'],
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 10.0),
                Text(user['name']),
                Text(user['lastname']),
                Text(user['city']),
              ],
            ),
          );
        },
      ),
    );
  }
}
