import 'package:flutter/material.dart';
import 'package:guruh1/core/routes/app_pages.dart';
import 'package:guruh1/core/routes/app_routes.dart';
import 'package:guruh1/core/theme/theme.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: AppPages.auth,
      ),
    );
  }
}
