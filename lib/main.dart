import 'package:flutter/material.dart';
import 'package:guruh1/features/auth/presentation/provider/this_provaider.dart';
import 'package:guruh1/features/exzam/presentation/pages/Login.dart';
import 'package:guruh1/features/exzam/presentation/pages/sign_up.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThisProvaider(), child: ExamApp()),
  );
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login()
      );

    
  }
}
