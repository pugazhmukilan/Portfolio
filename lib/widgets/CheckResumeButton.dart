import 'package:flutter/material.dart';

class CheckResumeButton extends StatefulWidget {
  const CheckResumeButton({super.key});

  @override
  State<CheckResumeButton> createState() => _CheckResumeButtonState();
}

class _CheckResumeButtonState extends State<CheckResumeButton> {
  @override
  bool _isHovered = false;
  Widget build(BuildContext context) {
  //   return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //     foregroundColor: Colors.white,
  //     backgroundColor: Colors.black, // Text color
  //     elevation: 5, // Shadow depth of the button
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(20), // Rounded corners
  //   ),
  // ),
  //     onPressed: (){},
  //     onHover: call(),
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Text("Click for Reusme"),
  //     ),

      
  //     );
       return  MouseRegion(
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


