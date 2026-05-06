import 'package:flutter/material.dart';
import 'package:guruh1/core/theme/provider/theme_provider.dart';
import 'package:guruh1/features/home/models/post.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final box = Hive.box('myBox');
  final postBox = Hive.box('postBox');

  int son = 0;
  @override
  Widget build(BuildContext context) {
    son = box.get('son') ?? 0;
    return Scaffold(
      body: Center(
        child: Switch(
          value: box.get('darkMode', defaultValue: true),
          onChanged: (v) {
            context.read<ThemeProvider>().changeMode(v);
            setState(() {
              box.put('darkMode', v);
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final post = postBox.get('first') as Post;
          print(post.name);
        },
      ),
    );
  }
}
