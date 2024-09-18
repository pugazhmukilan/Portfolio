import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart'; // Ensure your text styles are set up

class NavBar extends StatefulWidget {
  const NavBar({super.key});

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
            colors: [const Color.fromARGB(255, 241, 227, 248), const Color.fromARGB(255, 245, 241, 227)],
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
              NavButton(onpressed: () => print("pressed Home"), text: "Home"),
              NavButton(onpressed: () => print("pressed About me"), text: "About me"),
              NavButton(onpressed: () => print("pressed Skills"), text: "Skills"),
              NavButton(onpressed: () => print("pressed Projects"), text: "Projects"),
              NavButton(onpressed: () => print("pressed Contact"), text: "Contact"),
              
            ],
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final Function() onpressed;
  final String text;

  const NavButton({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onpressed,
        child: Text(
          text,
          style: KjostRegular.copyWith(fontSize: 18), // Adjust font size
        ),
      ),
    );
  }
}
