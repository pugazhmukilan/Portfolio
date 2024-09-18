import 'package:flutter/material.dart';

class ResponsiveDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Padding and Font Size based on Screen Width
    double getFontSize(double scaleFactor) => screenWidth * scaleFactor;

    return Scaffold(
      body: Stack(
        children: [
          // Centered Image
          Center(
            child: Image.asset(
              'assets/character.png',  // Replace with your image asset
              height: screenHeight * 0.5,  // Dynamic height based on screen
              width: screenWidth * 0.5,   // Dynamic width based on screen
              fit: BoxFit.contain,
            ),
          ),

          // Wrap Widget to Avoid Clutter
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // Space between words
                runSpacing: 10, // Space between rows
                children: [
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: getFontSize(0.05), // Adjust font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'UI/UX Designer',
                    style: TextStyle(fontSize: getFontSize(0.04)),
                  ),
                  Text(
                    'Freelancer',
                    style: TextStyle(fontSize: getFontSize(0.04)),
                  ),
                  Text(
                    'Creative Lead',
                    style: TextStyle(fontSize: getFontSize(0.04)),
                  ),
                  Text(
                    'Machine Learning',
                    style: TextStyle(fontSize: getFontSize(0.04)),
                  ),
                  Text(
                    'Artist',
                    style: TextStyle(fontSize: getFontSize(0.04)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
