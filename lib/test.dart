// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: CurvedBorderBox(),
//         ),
//       ),
//     );
//   }
// }

// class CurvedBorderBox extends StatelessWidget {
//   const CurvedBorderBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: const Size(280, 160),
//       painter: CurvedBorderPainter(),
//     );
//   }
// }

// class CurvedBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke;

//     final fillPaint = Paint()
//       ..color = Colors.blue.withOpacity(0.08)
//       ..style = PaintingStyle.fill;

//     final w = size.width;
//     final h = size.height;
//     const r = 20.0; // corner radius
//     const curveDepth = 18.0; // center curve depth

//     final path = Path();

//     // Start top-left after radius
//     path.moveTo(r, 0);

//     // ---------- TOP BORDER ----------
//     path.lineTo(w / 2 - 40, 0);

//     // top center inward curve
//     path.quadraticBezierTo(
//       w / 2,
//       curveDepth,
//       w / 2 + 40,
//       0,
//     );

//     path.lineTo(w - r, 0);

//     // top-right corner
//     path.quadraticBezierTo(w, 0, w, r);

//     // ---------- RIGHT BORDER ----------
//     path.lineTo(w, h - r);

//     // bottom-right corner
//     path.quadraticBezierTo(w, h, w - r, h);

//     // ---------- BOTTOM BORDER ----------
//     path.lineTo(w / 2 + 40, h);

//     // bottom center inward curve
//     path.quadraticBezierTo(
//       w / 2,
//       h - curveDepth,
//       w / 2 - 40,
//       h,
//     );

//     path.lineTo(r, h);

//     // bottom-left corner
//     path.quadraticBezierTo(0, h, 0, h - r);

//     // ---------- LEFT BORDER ----------
//     path.lineTo(0, r);

//     // top-left corner
//     path.quadraticBezierTo(0, 0, r, 0);

//     path.close();

//     canvas.drawPath(path, fillPaint);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
