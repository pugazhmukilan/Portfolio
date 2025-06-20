import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
 // For launching URLs

class SocialMediaFAB extends StatelessWidget {
  // Function to launch a URL
  

  @override
  Widget build(BuildContext context) {
 

    return const Stack(
        children: [
          // Your main content here (can be any widget)
          Positioned(
            right: 0,
            bottom: 5, // Adjust the bottom position as needed
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center, // Align children to the right within the column
              children: [
                SocialMediaWidget(icon:'assets/floating/leetcode.png',url:'https://leetcode.com/u/pugazhmukilanoffical2004/'),
                SocialMediaWidget(icon:'assets/floating/github.png',url:'https://github.com/pugazhmukilan'),
                SocialMediaWidget(icon:'assets/floating/linkedin.png',url:'https://www.linkedin.com/in/pugazh-mukilan-922206251/'),
              ],
            ),
          ),
        ],
      );
  }
  
}

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
    required this.icon,
    required this.url,
  });

  final String icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
          icon: SizedBox(
            width: 40, // Set your desired width
            height: 40, // Set your desired height
            child: Image.asset(icon),
          ),
          onPressed: () {
            _launchURL(url);
          },
        );
  }
}



void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }


//'assets/floating/leetcode.png'


/*RawMaterialButton(
  onPressed: () {},
  fillColor: Colors.blue,
  shape: const CircleBorder(),
  constraints: BoxConstraints.tightFor(
    width: 70.0,
    height: 70.0, // set custom height
  ),
  child: Icon(Icons.add, size: 30.0, color: Colors.white),
) */