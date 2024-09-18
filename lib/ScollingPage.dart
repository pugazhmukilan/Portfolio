import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/Screens/AboutMe.dart';
import 'package:portfolio/Screens/Home.dart';
import 'package:portfolio/Screens/ProjectsPage.dart';
import 'package:portfolio/Screens/SkillsPage.dart';
import 'package:portfolio/widgets/NavBar.dart';
import 'package:rive/rive.dart';

class ScrollingPage extends StatefulWidget {
  const ScrollingPage({super.key});

  @override
  State<ScrollingPage> createState() => _ScrollingPageState();
}

class _ScrollingPageState extends State<ScrollingPage> {
  // Define GlobalKeys for each section
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  
  final ScrollController _scrollController = ScrollController();

  // Function to scroll to a specific section
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    // media query for width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          // Background animations at top right and bottom left
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: width * 0.3, // Adjust width
              height: 300, // Fixed height for the animation
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0), // Blur effect
                child: RiveAnimation.asset(
                  'assets/gradients/backgroundgif.riv',
                  fit: BoxFit.cover, // Proper scaling of the animation
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: width * 0.3, // Adjust width
              height: 300, // Fixed height for the animation
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0), // Blur effect
                child: RiveAnimation.asset(
                  'assets/gradients/backgroundgif.riv',
                  fit: BoxFit.cover, // Proper scaling of the animation
                ),
              ),
            ),
          ),

          // Navbar fixed at the top of the screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent, // Slight transparency to blend with background
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: NavBar(
                onHomeTap: () => _scrollToSection(_homeKey),
                onAboutMeTap: () => _scrollToSection(_aboutMeKey),
                onSkillsTap: () => _scrollToSection(_skillsKey),
                onProjectsTap: () => _scrollToSection(_projectsKey),
              ),
            ),
          ),

          // Scrollable content below the NavBar
          Positioned.fill(
            top: 80, // Height of the fixed navbar
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Home(key: _homeKey), // Home widget with key
                    SizedBox(height: 60),
                    AboutMe(key: _aboutMeKey), // AboutMe widget with key
                    SizedBox(height: 60),
                    SkillsPages(key: _skillsKey), // SkillsPages widget with key
                    SizedBox(height: 60),
                    ProjectsPages(key: _projectsKey), // ProjectsPages widget with key
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
