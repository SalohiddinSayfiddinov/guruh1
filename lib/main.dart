import 'package:flutter/material.dart';
import 'package:guruh1/features/countries/presentation/pages/country_screen.dart';
import 'package:guruh1/features/countries/presentation/provider/country_provider.dart';
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
        create: (context) => CountryProvider(),
        child: CountryScreen(),
      ),
    );
  }
}

// O'zgartirish

// plus -> git add .
// habar yozamiz -> git commit -m "habar"
// joylaymiz -> git push origin main


// yangi repoga ulash 

// git init -> .git yaratadi
// git remote add origin <URL>
// git push -u origin main --force

// ko'pchilik bo'lib ishlash

// branch ochish -> git checkout -b <nomi>
// branchga o'tish -> git checkout <nomi>

