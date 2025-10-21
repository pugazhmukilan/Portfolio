import 'package:flutter/material.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';
import 'package:portfolio/constants/Text_Styles.dart';
import 'package:portfolio/widgets/CheckResumeButton.dart';

String link = "https://drive.google.com/file/d/130xy-7rWrGTTsKs1;hebgJmG14YQmygSX/view?usp=drive_link";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 16, tablet: 24, desktop: 32),
      ),
      child: Column(
        children: [
          SizedBox(height: Responsive.getValue(context, mobile: 20, tablet: 30, desktop: 40)),

          // Profile Avatar - Responsive sizing
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: Responsive.getValue(context, mobile: 80, tablet: 120, desktop: 150),
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/images/meImagesmall.png"),
            ),
          ),

          SizedBox(height: Responsive.getValue(context, mobile: 16, tablet: 20, desktop: 24)),
          
          // Name - Responsive font size
          Center(
            child: Text(
              "Pugazh Mukilan",
              style: AppTextStyles.KjosefinSansRegular.copyWith(
                color: AppColors.text,
                fontSize: Responsive.getValue(context, mobile: 40, tablet: 80, desktop: 150),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          SizedBox(height: Responsive.getValue(context, mobile: 8, tablet: 12, desktop: 16)),
          
          // Subtitle - Responsive font and spacing
          Text(
            "Building Software product and\nmaking life easy",
            style: AppTextStyles.KjostRegular.copyWith(
              color: AppColors.textTertiary,
              fontSize: Responsive.getValue(context, mobile: 14, tablet: 16, desktop: 18),
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: Responsive.getValue(context, mobile: 16, tablet: 20, desktop: 24)),
          
          CheckResumeButton(),
          
          SizedBox(height: Responsive.getValue(context, mobile: 60, tablet: 80, desktop: 120)),
          
          // Tech Stack Marquee - Responsive width
          Container(
            width: Responsive.getValue(
              context,
              mobile: MediaQuery.of(context).size.width * 0.9,
              tablet: MediaQuery.of(context).size.width * 0.7,
              desktop: 600,
            ),
            color: Colors.transparent,
            child: MarqueeList(
              scrollDirection: Axis.horizontal,
              scrollDuration: Duration(seconds: 3),
              children: _buildTechStackIcons(context),
            ),
          ),
        ],
      ),
    );
  }

  /// Build tech stack icons with responsive sizing
  List<Widget> _buildTechStackIcons(BuildContext context) {
    final iconSize = Responsive.getValue(context, mobile: 40.0, tablet: 50.0, desktop: 60.0);
    
    final techStack = [
      'assets/icons/dart.png',
      'assets/icons/flutter.png',
      'assets/icons/firebase.png',
      'assets/icons/fastapi.png',
      'assets/icons/git.png',
      'assets/icons/github.png',
      'assets/icons/java.png',
      'assets/icons/python.png',
      'assets/icons/postgres.png',
      'assets/icons/uiux.png',
      'assets/icons/sql.png',
      'assets/icons/sklearn.png',
    ];

    // Duplicate for smooth marquee effect
    return [...techStack, ...techStack]
        .map((path) => _iconImage(iconSize, path))
        .toList();
  }

  Widget _iconImage(double width, String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: Image.asset(assetPath, fit: BoxFit.contain),
      ),
    );
  }
}
