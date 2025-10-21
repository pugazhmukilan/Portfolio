import 'package:flutter/material.dart';

const double pagewidth = 900;

/// Responsive design helper class
/// Provides consistent breakpoints and responsive values across the app
class Responsive {
  // Breakpoint definitions
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;

  /// Check if current screen is mobile size
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMaxWidth;

  /// Check if current screen is tablet size
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileMaxWidth &&
      MediaQuery.of(context).size.width < tabletMaxWidth;

  /// Check if current screen is desktop size
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletMaxWidth;

  /// Get responsive value based on screen size
  /// If tablet value is not provided, it defaults to mobile value
  static T getValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return desktop;
  }

  /// Get responsive padding for pages
  static EdgeInsets pagePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: getValue(context, mobile: 16, tablet: 32, desktop: 64),
      vertical: getValue(context, mobile: 16, tablet: 24, desktop: 32),
    );
  }

  /// Get responsive spacing between sections
  static double sectionSpacing(BuildContext context) {
    return getValue(context, mobile: 40, tablet: 60, desktop: 80);
  }
}