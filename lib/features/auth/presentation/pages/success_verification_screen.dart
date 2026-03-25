// import 'package:flutter/material.dart';
// import 'package:guruh1/core/constants/app_colors.dart';
// import 'package:guruh1/core/widgets/buttons.dart';
// import 'package:guruh1/features/auth/presentation/widgets/congrats_image.dart';

// class SuccessVerificationScreen extends StatelessWidget {
//   const SuccessVerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CongratsImage(),
//             SizedBox(height: 40.0),
//             Text(
//               'Congratulation!',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 6),
//             Text(
//               'your account is complete, please enjoy the best menu from us.',
//               textAlign: .center,
//               style: TextStyle(fontSize: 16.0, color: Color(0xFFA6A6A6)),
//             ),
//             SizedBox(height: 40),
//             PrimaryButton(
//               title: 'Get Started',
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
