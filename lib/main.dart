import 'package:flutter/material.dart';
import 'package:guruh1/core/routes/app_pages.dart';
import 'package:guruh1/core/routes/app_routes.dart';
import 'package:guruh1/core/theme/provider/theme_provider.dart';
import 'package:guruh1/core/theme/theme.dart';
import 'package:guruh1/features/products/models/product_model.dart';
import 'package:guruh1/hive/hive_registrar.g.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox('myBox');
  await Hive.openBox('postBox');
  await Hive.openBox<Product>('productsBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider()..initMode(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().mode,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: AppPages.splash,
    );
  }
}
