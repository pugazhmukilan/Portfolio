import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/Screens/AboutMe.dart';
import 'package:portfolio/Screens/Home.dart';
import 'package:portfolio/Screens/ProjectsPage.dart';
import 'package:portfolio/Screens/SkillsPage.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';
import 'package:portfolio/widgets/NavBar.dart';
import 'package:portfolio/widgets/floatingactionbutton.dart';
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
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        floatingActionButton: SocialMediaFAB(),
        // Add drawer for mobile navigation
        endDrawer: Responsive.isMobile(context)
            ? buildNavBarDrawer(
                context: context,
                onHomeTap: () => _scrollToSection(_homeKey),
                onAboutMeTap: () => _scrollToSection(_aboutMeKey),
                onSkillsTap: () => _scrollToSection(_skillsKey),
                onProjectsTap: () => _scrollToSection(_projectsKey),
              )
            : null,
        body: Stack(
          children: [
            // Background animations at top right and bottom left
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: width * 0.3,
                height: 300,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
                  child: RiveAnimation.asset(
                    'assets/gradients/backgroundgif.riv',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: width * 0.3,
                height: 300,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
                  child: RiveAnimation.asset(
                    'assets/gradients/backgroundgif.riv',
                    fit: BoxFit.cover,
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
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  vertical: Responsive.getValue(context, mobile: 12, tablet: 16, desktop: 16),
                ),
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
              top: Responsive.getValue(context, mobile: 60, tablet: 70, desktop: 80),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.getValue(context, mobile: 8, tablet: 16, desktop: 24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Home(key: _homeKey),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      
                      AboutMe(key: _aboutMeKey),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      
                      SkillsPages(key: _skillsKey),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                      
                      ProjectsPages(key: _projectsKey),
                      SizedBox(height: Responsive.sectionSpacing(context)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
