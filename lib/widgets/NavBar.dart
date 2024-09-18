import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart'; // Ensure your text styles are set up
 // Import the NavButton widget

class NavBar extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutMeTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;

  const NavBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutMeTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 241, 227, 248),
              const Color.fromARGB(255, 245, 241, 227)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(50),
          //border: Border.all(color: Colors.black.withOpacity(0.1)), // Subtle border
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Evenly space out the buttons
            children: [
              NavButton(onPressed: widget.onHomeTap, text: 'Home'),
              NavButton(onPressed: widget.onAboutMeTap, text: 'About Me'),
              NavButton(onPressed: widget.onSkillsTap, text: 'Skills'),
              NavButton(onPressed: widget.onProjectsTap, text: 'Projects'),
            ],
          ),
        ),
      ),
    );
  }
}



class NavButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const NavButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: KjostRegular.copyWith(fontSize: 18), // Adjust font size
        ),
      ),
    );
  }
}
