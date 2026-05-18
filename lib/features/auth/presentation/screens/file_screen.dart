import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({super.key});

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            final result = await OpenFile.open('assets/audios/rihanna.m4a');
            print(result.message);
          },
          icon: const Icon(Icons.open_in_browser),
        ),
      ),
    );
  }
}
