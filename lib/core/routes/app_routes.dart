import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/core/routes/app_pages.dart';
import 'package:guruh1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh1/features/auth/presentation/screens/auth_screen.dart';
import 'package:guruh1/features/auth/presentation/screens/file_screen.dart';
import 'package:guruh1/features/auth/repositories/auth_repository.dart';
import 'package:guruh1/features/home/presentation/cubit/post_cubit.dart';
import 'package:guruh1/features/home/presentation/screens/home_screen.dart';
import 'package:guruh1/features/home/presentation/screens/search_screen.dart';
import 'package:guruh1/features/products/cubit/product_cubit.dart';
import 'package:guruh1/features/products/pages/products_screen.dart';
import 'package:guruh1/features/products/repos/products_repo.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppPages.products:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => ProductCubit(repo: ProductsRepo()),
              child: const ProductsScreen(),
            );
          },
        );
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
            return const SearchScreen();
          },
        );

      case AppPages.auth:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => AuthCubit(repo: AuthRepository()),
              child: const FileScreen(),
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const PageNotFound();
          },
        );
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found', style: TextStyle(fontSize: 44.0)),
      ),
    );
  }
}
