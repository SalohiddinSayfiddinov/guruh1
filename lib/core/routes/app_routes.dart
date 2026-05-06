import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/core/routes/app_pages.dart';
import 'package:guruh1/features/home/presentation/cubit/post_cubit.dart';
import 'package:guruh1/features/home/presentation/screens/home_screen.dart';
import 'package:guruh1/features/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppPages.home:
        return MaterialPageRoute(
          builder: (context) {
            final String title = args as String;
            return BlocProvider(
              create: (context) => PostCubit(),
              child: HomeScreen(title: title),
            );
          },
        );
      case AppPages.splash:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return PageNotFound();
          },
        );
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page not found', style: TextStyle(fontSize: 44.0)),
      ),
    );
  }
}
