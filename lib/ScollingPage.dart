import "dart:ui";

import "package:flutter/material.dart";
import "package:portfolio/Screens/AboutMe.dart";
import "package:portfolio/Screens/Home.dart";
import "package:portfolio/Screens/ProjectsPage.dart";
import "package:portfolio/Screens/SkillsPage.dart";
import "package:portfolio/widgets/NavBar.dart";
import "package:rive/rive.dart";

class ScrollingPage extends StatefulWidget {
  const ScrollingPage({super.key});

  @override
  State<ScrollingPage> createState() => _ScrollingPageState();
}

class _ScrollingPageState extends State<ScrollingPage> {
  @override
  Widget build(BuildContext context) {
    //media quer of width
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      // appBar: AppBar(title:NavBar(),
      //                 toolbarHeight: 80,
      //                 backgroundColor: const Color.fromARGB(0, 255, 255, 255),),
      body: Stack(
        children:[ 
          Positioned(
            top:0,
            right:0,
            child: SizedBox(
              width: width * 0.3, // Adjust width
              height: 300, // Provide a fixed height
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0), // Adjust blur intensity
                child: RiveAnimation.asset(
                  'assets/gradients/backgroundgif.riv',
                  fit: BoxFit.cover, 
                  // Ensures the Rive animation scales properly
                ),
              ),
            ),
          ),

          Positioned(
            bottom:0,
            left:0,
            child: SizedBox(
              width: width * 0.3, // Adjust width
              height: 300, // Provide a fixed height
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0), // Adjust blur intensity
                child: RiveAnimation.asset(
                  'assets/gradients/backgroundgif.riv',
                  fit: BoxFit.cover, // Ensures the Rive animation scales properly
                ),
              ),
            ),
          ),
          SingleChildScrollView(
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: NavBar(),
              ),
              
                Home(),
                SizedBox(height:60),
                AboutMe(),
                
                SizedBox(height:60),
                SkillsPages(),
                SizedBox(height:60),
                ProjectsPages(),
              
              ],)
          
          
        ),
        
        
        
        ]
        
      ),
    );
  }
}