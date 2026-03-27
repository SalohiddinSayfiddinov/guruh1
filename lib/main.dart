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
