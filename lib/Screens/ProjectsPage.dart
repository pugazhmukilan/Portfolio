import "package:flutter/material.dart";
import "package:portfolio/constants/Colors.dart";
import "package:portfolio/constants/Text_Styles.dart";
import "package:portfolio/constants/ScreenConstraints.dart";
import "package:portfolio/widgets/project.dart";

class ProjectsPages extends StatefulWidget {
  const ProjectsPages({super.key});

  @override
  State<ProjectsPages> createState() => _ProjectsPagesState();
}

class _ProjectsPagesState extends State<ProjectsPages> {
  // List of projects
  final List<Map<String, dynamic>> projects = [
    {
      'image': 'assets/images/kiptposter.png',
      'title': 'Kipt - Smart Warranty & Asset Manager',
      'content': 'Your personal offline-first vault for managing product warranties, bills, receipts, and rental assets. Features include warranty tracking, digital bill storage, smart notifications, and biometric security.',
      'tags': ['Flutter', 'Dart', 'Hive', 'Offline-First', 'Biometrics'],
      'link': 'https://github.com/pugazhmukilan/kipt-warranty-vault',
    },
    // New AI/ML Projects
    {
      'image': "assets/images/blank.png", // Will show GitHub fallback
      'title': 'MCP-FlutterDoc: Intelligent Flutter Documentation Assistant',
      'content': 'A Model Context Protocol (MCP) server that brings Flutter documentation and community solutions directly into Claude Desktop. It merges official references and Stack Overflow insights to deliver instant, contextually relevant answers for Flutter developers.',
      'tags': ['Python', 'JSON-RPC 2.0', 'MCP Protocol', 'REST APIs'],
      'link': 'https://github.com/pugazhmukilan/MCP-FlutterDoc',
    },
    {
      'image': "assets/images/blank.png",
      'title': 'InterviewQuestion-GeneratorAI: Smart Study & Interview Companion',
      'content': 'A Generative AI application that transforms academic or professional PDFs into fully prepared interview question-answer sets. Designed for students and recruiters, it uses Google\'s Gemini model to extract, chunk, and refine context-aware questions.',
      'tags': ['Python', 'Streamlit', 'LangChain', 'Google Gemini', 'FAISS'],
      'link': 'https://github.com/pugazhmukilan/InterviewQuestion-GeneratorAI',
    },
    {
      'image': "assets/images/blank.png",
      'title': 'KuripAPI: AI-Powered Recipe Generation Engine',
      'content': 'A creative culinary AI API that generates personalized recipes based on ingredients users already have. Built with FastAPI and integrated into a Flutter frontend, KuripAPI bridges AI and daily life—making home cooking effortless and intelligent.',
      'tags': ['Python', 'FastAPI', 'Flutter', 'AI/ML', 'REST APIs'],
      'link': 'https://github.com/pugazhmukilan/KuripAPI',
    },
    {
      'image': "assets/images/blank.png",
      'title': 'AI-Expense-Tracker: Intelligent Financial Management',
      'content': 'A sleek Flutter + Node.js expense management app infused with Google Gemini AI. It auto-categorizes expenses, analyzes spending habits, and produces predictive insights for future budgeting—redefining personal finance through AI.',
      'tags': ['Flutter', 'Node.js', 'Google Gemini AI', 'PostgreSQL', 'JWT Auth'],
      'link': 'https://github.com/pugazhmukilan/AI-Expense-Tracker',
    },
    {
      'image': "assets/images/blank.png",
      'title': 'Sarcasm-Detection-Robust-NLP: Understanding Human Intent',
      'content': 'An advanced NLP and deep learning model that detects sarcasm in social posts and news headlines. Built with BiLSTM architectures, it teaches machines to recognize subtle emotional contradictions—a breakthrough for sentiment analysis.',
      'tags': ['Python', 'TensorFlow', 'Keras', 'NLTK', 'BiLSTM'],
      'link': 'https://github.com/pugazhmukilan/Sarcasm-Detection-Robust-NLP',
    },
    {
      'image': "assets/images/blank.png",
      'title': 'NeuroBrush-CycleGAN: Artistic Neural Style Transfer',
      'content': 'A visually stunning application of CycleGAN technology that turns real-world images into artworks inspired by painters like Van Gogh or Monet. Demonstrates mastery over computer vision and generative models, fusing deep learning with creativity.',
      'tags': ['Python', 'PyTorch', 'CycleGAN', 'Computer Vision', 'Deep Learning'],
      'link': 'https://github.com/pugazhmukilan/NeuroBrush-CycleGAN',
    },
    {
      'image': 'assets/images/fluxapp.png',
      'title': 'FLUX',
      'content': 'FLUX isn\'t just another habit tracker; it\'s a visual journey of your commitment. Built with a clean, minimalist aesthetic, FLUX helps you focus on what truly matters: building consistent, positive habits. With its unique streak-based system and an elegant UI, it transforms self-improvement into a rewarding and beautiful experience. Track your progress, celebrate your milestones, and watch your habits flourish with FLUX.',
      'tags': ['Flutter', 'Habit Tracker', 'UI/UX', 'Streaks'],
      'link': 'https://github.com/pugazhmukilan/FLUX-HabitStreakFlutterApp',
    },
    
    // Original Projects
    {
      'image': 'assets/images/portfolio.png',
      'title': 'Flutter Website (Portfolio)',
      'content': 'Personal Portfolio made using flutter used many animations, clean UI design responsive for different screens.',
      'tags': ['Flutter', 'Portfolio', 'Responsive', 'Clean UI'],
      'link': 'https://github.com/pugazhmukilan/Portfolio',
    },
    {
      'image': 'assets/images/doitproject.png',
      'title': 'Productivity App',
      'content': 'Your productivity app, developed with Flutter and SQLite, offers efficient task management with priority and custom categories. Its user-centric design, crafted in Figma, ensures a seamless and intuitive interface.',
      'tags': ['Flutter', 'SQLite', 'Productivity', 'Clean UI'],
      'link': 'https://github.com/pugazhmukilan/Doit',
    },
    {
      'image': 'assets/images/dermiproject.png',
      'title': 'Dermi AI',
      'content': 'The Flutter app predicts skin diseases using CNN models, with Firebase for backend and authentication, a chatbot for extra information, and a Figma-designed UI for a great user experience.',
      'tags': ['Flutter', 'ML CNN', 'ChatBot', 'Firebase', 'Modelbit'],
      'link': 'https://github.com/pugazhmukilan/Portfolio',
    },
    {
      'image': 'assets/images/virtualassistantproject.png',
      'title': 'Virtual Assistant',
      'content': 'Developed a Python virtual assistant with SQL backend, integrating WhatsApp, distance calculation, Amazon orders, speech, Q&A, word lookup, YouTube search, and voice support.',
      'tags': ['Python', 'Virtual Assistant', 'ChatBot', 'Tkinter'],
      'link': 'https://github.com/pugazhmukilan/virtual_assistant',
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    
    // Determine number of columns based on screen size
    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Responsive.getValue(context, mobile: 20, tablet: 30, desktop: 40),
          horizontal: Responsive.getValue(context, mobile: 16, tablet: 24, desktop: 32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Page Title
            Text(
              "Projects",
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
            
            SizedBox(height: Responsive.getValue(context, mobile: 30, tablet: 40, desktop: 50)),
           
            // Projects Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                // Use a fixed main axis extent (row height) for consistent cards
                mainAxisExtent: isMobile
                    ? 500.0 // taller on mobile to avoid cramped content
                    : (isTablet ? 480.0 : 470.0),
                crossAxisSpacing: isMobile ? 16 : 24,
                mainAxisSpacing: isMobile ? 24 : 24,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Project(
                  image: project['image'],
                  title: project['title'],
                  content: project['content'],
                  tags: List<String>.from(project['tags']),
                  imageOnRight: false,
                  link: project['link'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
