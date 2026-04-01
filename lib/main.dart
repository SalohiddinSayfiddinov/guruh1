import 'package:flutter/material.dart';
import 'package:guruh1/features/auth/presentation/pages/login_screen.dart';
import 'package:guruh1/features/auth/presentation/provider/auth_provider.dart';
import 'package:guruh1/features/new_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: NewScreen(),
      ),
    );
  }
}
