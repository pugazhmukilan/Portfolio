import 'package:flutter/material.dart';

class AppTextStyles {
  // JosefinSans
  static const TextStyle KjosefinSansRegular = TextStyle(
    fontFamily: 'JosefinSans',
    fontWeight: FontWeight.w400, // Regular
  );

  static const TextStyle KjosefinSansSemiBold = TextStyle(
    fontFamily: 'JosefinSans',
    fontWeight: FontWeight.w600, // SemiBold
  );

  // Jost
  static const TextStyle KjostBold = TextStyle(
    fontFamily: 'Jost',
    fontWeight: FontWeight.bold, // Bold
  );

  static const TextStyle KjostMedium = TextStyle(
    fontFamily: 'Jost',
    fontWeight: FontWeight.w500, // Medium
  );

  static const TextStyle KjostRegular = TextStyle(
    fontFamily: 'Jost',
    fontWeight: FontWeight.w400, // Regular
  );
}


TextStyle KjostRegular = AppTextStyles.KjostRegular.copyWith(fontSize: 25);