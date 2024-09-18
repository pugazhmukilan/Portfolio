import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart';

class SkillsPages extends StatefulWidget {
  const SkillsPages({super.key});

  @override
  State<SkillsPages> createState() => _SkillsPagesState();
}

class _SkillsPagesState extends State<SkillsPages> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      constraints: BoxConstraints(
        minHeight: height * 0.6, // Ensure minimum height
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
            style: AppTextStyles.KjosefinSansSemiBold.copyWith(
              fontSize: width > 1400 ? 250 : width * 0.2,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          SizedBox(height: 20),
          
        ],
      ),
    );
  }
}
