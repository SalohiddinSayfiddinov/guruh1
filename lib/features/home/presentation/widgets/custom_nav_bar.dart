// import 'package:flutter/material.dart';
// import 'package:guruh1/features/home/presentation/provider/home_provider.dart';
// import 'package:provider/provider.dart';

// class MyBottomNavBar extends StatelessWidget {
//   const MyBottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       onTap: context.read<HomeProvider>().changePage,
//       currentIndex: context.watch<HomeProvider>().currentIndex,
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//     );
//   }
// }
