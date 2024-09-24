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
      
      child: Row(
        children: [
          // Image inside a rounded container
          Container(
            width: kwidth>700 ? 80:60, // Set width and height for the image container
            height: kwidth>700 ? 80:60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black12),
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
