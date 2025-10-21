import 'package:flutter/material.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:portfolio/constants/Text_Styles.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 16, tablet: 32, desktop: 64),
        vertical: Responsive.getValue(context, mobile: 20, tablet: 30, desktop: 40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Page Title
          Text(
            "About Me",
            style: AppTextStyles.KjosefinSansSemiBold.copyWith(
              fontSize: Responsive.getValue(
                context,
                mobile: 48,
                tablet: 100,
                desktop: 200,
              ),
              color: AppColors.text,
            ),
          ),
          
          SizedBox(height: Responsive.getValue(context, mobile: 20, tablet: 30, desktop: 40)),
          
          // Profile Image - Responsive sizing
          Container(
            width: Responsive.getValue(
              context,
              mobile: 280,
              tablet: 400,
              desktop: 600,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/aboutme.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          SizedBox(height: Responsive.getValue(context, mobile: 24, tablet: 32, desktop: 40)),
          
          // About Me Content
          Container(
            constraints: BoxConstraints(
              maxWidth: Responsive.getValue(
                context,
                mobile: 350,
                tablet: 600,
                desktop: 800,
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Hello! I'm Pugazh Mukilan",
                  style: AppTextStyles.KjosefinSansRegular.copyWith(
                    fontSize: Responsive.getValue(context, mobile: 24, tablet: 32, desktop: 40),
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: Responsive.getValue(context, mobile: 16, tablet: 20, desktop: 24)),
                
                Text(
                  "A passionate software developer specializing in building elegant solutions to complex problems. "
                  "I focus on creating intuitive user experiences with clean, efficient code.",
                  style: AppTextStyles.KjostRegular.copyWith(
                    fontSize: Responsive.getValue(context, mobile: 14, tablet: 16, desktop: 18),
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: Responsive.getValue(context, mobile: 12, tablet: 16, desktop: 20)),
                
                Text(
                  "My expertise spans across Flutter development, backend systems, and UI/UX design. "
                  "I'm constantly learning and exploring new technologies to stay at the forefront of software development.",
                  style: AppTextStyles.KjostRegular.copyWith(
                    fontSize: Responsive.getValue(context, mobile: 14, tablet: 16, desktop: 18),
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}