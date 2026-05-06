import 'package:flutter/material.dart';
import 'package:guruh1/core/routes/app_pages.dart';
import 'package:guruh1/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // init();
  }

  double top = 100;

  void init() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      top = MediaQuery.heightOf(context) / 2;
    });
    await Future.delayed(Duration(seconds: 1));
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppPages.home,
      (route) => false,
      arguments: "Title",
    );
  }

  String gender = "Male";

  final List<String> genders = [
    'Male',
    'Female',
    'Helicopter',
    'Walmart Bag',
    'Mario',
    'Baskeball',
  ];

  final valueListenable = ValueNotifier<String?>('Male');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == .light
            ? AppColors.bgLight2
            : AppColors.bgDark2,
      ),
      body: Stack(
        alignment: .topCenter,
        children: [
          AnimatedPositioned(
            top: 200,
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceOut,
            child: Text(
              '1234',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 44.0),
            ),
          ),
          AnimatedPositioned(
            top: 300,
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceOut,
            child: Text('1234', style: TextStyle(fontSize: 44.0)),
          ),
        ],
      ),
    );
  }
}
