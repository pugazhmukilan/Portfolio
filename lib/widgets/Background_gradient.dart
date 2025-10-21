import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class Background_gradient extends StatelessWidget {
  const Background_gradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.bg1,
                AppColors.bg2,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        // Blurred Rive animation in the top right corner
        Positioned(
          top: -50,
          right: -80,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100,tileMode: TileMode.mirror),
            child: const SizedBox(
              width: 400,
              height: 400,
              child: RiveAnimation.asset(
                'assets/gradients/backgroundgif.riv',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Blurred Rive animation in the bottom left corner
        Positioned(
          bottom: -50,
          left: -80,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: const SizedBox(
              width: 450,
              height: 450,
              child: RiveAnimation.asset(
                'assets/gradients/backgroundgif.riv',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
