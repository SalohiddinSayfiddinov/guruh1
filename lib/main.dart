import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/presentation/cubit/counter_cubit.dart';
import 'package:guruh1/features/home/presentation/cubit/cubit/post_cubit.dart';
import 'package:guruh1/features/home/presentation/cubit/home_cubit.dart';
import 'package:guruh1/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => PostCubit()),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
