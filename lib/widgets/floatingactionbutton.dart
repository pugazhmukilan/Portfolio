import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 // For launching URLs

class SocialMediaFAB extends StatelessWidget {
  // Function to launch a URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {}, // You can keep this empty or handle other logic
       // For a rectangular shape
      
      label: Column(
        mainAxisSize: MainAxisSize.min, // Ensures the button only takes the space it needs
        children: [
          // Facebook Button
          IconButton(
            icon: Image.asset('assets/floating/github.png'), // Replace with your asset path
            iconSize: 10, // Adjust size if needed
            onPressed: () {
              _launchURL('https://github.com/pugazhmukilan'); // Redirect to Facebook
            },
          ),
          // Twitter Button
          IconButton(
            icon: Image.asset('assets/floating/linkedin.png'), // Replace with your asset path
            iconSize: 10,
            onPressed: () {
              _launchURL('https://www.linkedin.com/in/pugazh-mukilan-922206251/'); // Redirect to Twitter
            },
          ),
          // LinkedIn Button
          
          // GitHub Button
         

          IconButton(
            icon: Image.asset('assets/floating/leetcode.png'), // Replace with your asset path
            iconSize: 10,
            onPressed: () {
              _launchURL('https://leetcode.com/u/pugazhmukilanoffical2004/'); // Redirect to GitHub
            },
          ),
        ],
      ),
    );
  }
}
