import 'package:flutter/material.dart';
import 'package:marquee_list/marquee_list.dart';

class Project extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final List<String> tags;
  final bool imageOnRight;

  const Project({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.tags,
    this.imageOnRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the screen width is less than 600 pixels for mobile
          bool isMobile = constraints.maxWidth < 600;
          
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 900, // Limit the width for larger screens
                // maxHeight:isMobile? 700 : 800, // Max height constraint for the widget
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (isMobile) _buildImage(), // Show image on top for mobile
                    if (isMobile) const SizedBox(height: 16.0),
                    if (isMobile) _buildTextContent(context), // Show text content and tags below the image for mobile
                    if (!isMobile) Row( // Show image and text content side by side for larger screens
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!imageOnRight) _buildImage(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: _buildTextContent(context),
                          ),
                        ),
                        if (imageOnRight) _buildImage(),
                      ],
                    ),
                    if (!isMobile) const SizedBox(height: 16.0),
                    //if (!isMobile) _buildTags(context), // Show tags horizontally for larger screens
                    if (isMobile) _buildTags(context), // Show tags horizontally for mobile
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget to build the image
  Widget _buildImage() {
    return Image.asset(
      image,
      width: 240,
      height: 240,
      fit: BoxFit.fitWidth,
    );
  }

  // Widget to build the text content
  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 8.0),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height:10),
        _buildTags(context),
      ],
    );
  }

  // Widget to build the tags section
  Widget _buildTags(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: tags.map((tag) {
        return Container(
          width: screenWidth < 600 ? screenWidth * 0.25 : 100, // Adjust size based on screen width
          child: Chip(
            label: MarqueeList(
              scrollDirection: Axis.horizontal,
              scrollDuration: Duration(seconds: 2),
              children: [
                Text(
                  tag,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            backgroundColor: Colors.black,
          ),
        );
      }).toList(),
    );
  }
}
