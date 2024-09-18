import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Background_gradient extends StatelessWidget {
  const Background_gradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90.0,
      child: ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust blur intensity
      child: RiveAnimation.asset(
        'assets/gradients/backgroundgif.riv',
      ),
              ),
    );
  }
}
