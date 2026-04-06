import 'package:flutter/material.dart';
import 'package:guruh1/features/exzam/presentation/pages/october.dart';
import 'package:guruh1/features/exzam/presentation/pages/onbording.dart';


void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Onbording()
    );
  }
}
