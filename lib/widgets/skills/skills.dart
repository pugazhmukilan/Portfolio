import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String year;

  const SkillWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 1), // Margin around the container
      child: Row(
        children: [
          // Image inside a rounded container
          Container(
            width: kwidth>700 ? 100:80, // Set width and height for the image container
            height: kwidth>700 ? 100:80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.transparent),
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Padding inside the container
              child: Image.asset(imagePath), // Load image from asset
            ),
          ),
          const SizedBox(width: 10), // Space between image and text
          // Title and Year
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize:kwidth>800 ? 18:16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  year,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
