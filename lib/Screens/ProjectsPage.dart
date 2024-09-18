import "package:flutter/material.dart";
import "package:portfolio/constants/Text_Styles.dart";
import "package:portfolio/widgets/project.dart";

class ProjectsPages extends StatefulWidget {
  const ProjectsPages({super.key});

  @override
  State<ProjectsPages> createState() => _ProjectsPagesState();
}

class _ProjectsPagesState extends State<ProjectsPages> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Responsive header text
            Text(
              "Projects",
              style: AppTextStyles.KjosefinSansSemiBold.copyWith(
                fontSize: kwidth > 1400 ? 250 : kwidth * 0.2,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            const SizedBox(height: 30), // Add some spacing between header and content
           
            // Project Widgets
            Project(
              image: 'assets/images/portfolio.png',
              title: 'Flutter Website (Portfolio)',
              content: 'Personal Portfolio made using flutter used many animations, clean UI design responsive for different screens.',
              tags: ['Flutter', 'Portfolio', 'Responsive', 'Clean UI'],
              imageOnRight: true,
            ),
            Project(
              image: 'assets/images/doitproject.png',
              title: 'Productivity App',
              content: 'Your productivity app, developed with Flutter and SQLite, offers efficient task management with priority and custom categories. Its user-centric design, crafted in Figma, ensures a seamless and intuitive interface for enhanced productivity.',
              tags: ['Flutter', 'SQLite', 'Productivity', 'Clean UI'],
              imageOnRight: false,
            ),
            Project(
              image: 'assets/images/dermiproject.png',
              title: 'Dermi AI',
              content: 'The Flutter app predicts skin diseases using CNN models, with Firebase for backend and authentication, a chatbot for extra information, and a Figma-designed UI for a great user experience.',
              tags: ['Flutter', 'ML CNN', 'ChatBot', 'Clean UI', 'Modelbit'],
              imageOnRight: true,
            ),
            Project(
              image: 'assets/images/virtualassistantproject.png',
              title: 'Virtual Assistant',
              content: 'Developed a Python virtual assistant with SQL backend, integrating WhatsApp, distance calculation, Amazon orders, speech, Q&A, word lookup, YouTube search, news scraping, and voice support, using Tkinter for the frontend.',
              tags: ['Python', 'Virtual Assistant', 'ChatBot', 'Tkinter'],
              imageOnRight: false,
            ),
          ],
        ),
      ),
    );
  }
}
