import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class CheckResumeButton extends StatefulWidget {
  const CheckResumeButton({super.key});

  @override
  State<CheckResumeButton> createState() => _CheckResumeButtonState();
}

class _CheckResumeButtonState extends State<CheckResumeButton> {
  
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
  
     return GestureDetector(
      onTap: () {
        _launchURL("https://drive.google.com/uc?export=download&id=130xy-7rWrGTTsKs1hebgJmG14YQmygSX");
        //downloadResume();
      },
      child: MouseRegion(
        onEnter: (_) => _updateHoverState(true),
        onExit: (_) => _updateHoverState(false),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 10),
          switchInCurve: Curves.bounceIn,
          switchOutCurve: Curves.bounceInOut,
          child: _isHovered
              ? Image.asset(
                  'assets/images/resumevarient.png',
                  key: ValueKey('hover'),
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  'assets/images/resumebutton.png',
                  key: ValueKey('default'),
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
    void _updateHoverState(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

}
call(){

}



void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }