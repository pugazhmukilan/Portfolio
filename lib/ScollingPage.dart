import 'package:flutter/material.dart';
import 'package:portfolio/Screens/AboutMe.dart';
import 'package:portfolio/Screens/ContactPage.dart';
import 'package:portfolio/Screens/Home.dart';
import 'package:portfolio/Screens/ProjectsPage.dart';
import 'package:portfolio/Screens/SkillsPage.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';
import 'package:portfolio/widgets/Background_gradient.dart';
import 'package:portfolio/widgets/NavBar.dart';
import 'package:portfolio/widgets/floatingactionbutton.dart';

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
  final GlobalKey _contactKey = GlobalKey();
  
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
    

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(210, 15, 16, 19),
        floatingActionButton: SocialMediaFAB(),
        // Add drawer for mobile navigation
        endDrawer: Responsive.isMobile(context)
            ? buildNavBarDrawer(
                context: context,
                onHomeTap: () => _scrollToSection(_homeKey),
                onAboutMeTap: () => _scrollToSection(_aboutMeKey),
                onSkillsTap: () => _scrollToSection(_skillsKey),
                onProjectsTap: () => _scrollToSection(_projectsKey),
                onContactTap: () => _scrollToSection(_contactKey),
              )
            : null,
        body: Stack(
          children: [
            Background_gradient(),
      
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
                  onContactTap: () => _scrollToSection(_contactKey),
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
                      
                      ContactPage(key: _contactKey),
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
