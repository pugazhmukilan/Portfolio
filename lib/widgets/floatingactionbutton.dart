import 'package:flutter/material.dart';
import 'package:portfolio/constants/Colors.dart';
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
                SocialMediaWidget(icon:'assets/floating/leetcode.png',url:'https://leetcode.com/u/pugazh2004/'),
                SocialMediaWidget(icon:'assets/floating/github.png',url:'https://github.com/pugazhmukilan'),
                SocialMediaWidget(icon:'assets/floating/linkedin.png',url:'https://www.linkedin.com/in/pugazh-mukilan-922206251/'),
              ],
            ),
          ),
        ],
      );
  }
  
}

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({
    super.key,
    required this.icon,
    required this.url,
  });

  final String icon;
  final String url;

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isHovered ? AppColors.primary.withOpacity(0.15) : Colors.transparent,
          border: Border.all(
            color: _isHovered ? AppColors.primary : Colors.transparent,
            width: 1,
          ),
        ),
        child: IconButton(
          icon: SizedBox(
            width: 32, // Set your desired width
            height: 32, // Set your desired height
            child: Image.asset(widget.icon),
          ),
          onPressed: () {
            _launchURL(widget.url);
          },
        ),
      ),
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