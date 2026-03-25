import 'package:flutter/material.dart';
import 'package:guruh1/core/assets/images.dart';
import 'package:guruh1/core/constants/app_colors.dart';

class CongratsImage extends StatelessWidget {
  const CongratsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 78,
              width: 78,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFEFD7DE),
                    Color(0xFFECDADF).withValues(alpha: 0),
                  ],
                  begin: .topCenter,
                  end: .bottomCenter,
                ),
              ),
            ),
            Image(image: AssetImage(AppImages.congrats), width: 90, height: 90),
          ],
        ),
        Container(color: AppColors.primary, width: 160, height: 1),
      ],
    );
  }
}
