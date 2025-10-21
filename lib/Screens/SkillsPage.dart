import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';
import 'package:portfolio/widgets/skills/skills.dart';

class SkillsPages extends StatefulWidget {
  const SkillsPages({super.key});

  @override
  State<SkillsPages> createState() => _SkillsPagesState();
}

class _SkillsPagesState extends State<SkillsPages> {
  final List<Map<String, String>> skills = [
    {'image': 'assets/icons/python.png', 'title': 'Python', 'year': '2020'},
    {'image': 'assets/icons/sql.png', 'title': 'SQL', 'year': '2020'},
    {'image': 'assets/icons/github.png', 'title': 'GitHub', 'year': '2021'},
    {'image': 'assets/icons/dart.png', 'title': 'Dart', 'year': '2022'},
    {'image': 'assets/icons/java.png', 'title': 'Java', 'year': '2022'},
    {'image': 'assets/icons/flutter.png', 'title': 'Flutter', 'year': '2022'},
    {'image': 'assets/icons/git.png', 'title': 'Git', 'year': '2022'},
    {'image': 'assets/icons/uiux.png', 'title': 'UI/UX', 'year': '2022'},
    {'image': 'assets/icons/firebase.png', 'title': 'FireBase', 'year': '2023'},
    {'image': 'assets/icons/figma.png', 'title': 'Figma', 'year': '2023'},
    {'image': 'assets/icons/sklearn.png', 'title': 'Sklearn', 'year': '2024'},
    {'image': 'assets/icons/numpy.png', 'title': 'Numpy', 'year': '2024'},
    {'image': 'assets/icons/postgres.png', 'title': 'Postgres', 'year': '2024'},
    {'image': 'assets/icons/mlflow.png', 'title': 'ML Flow', 'year': '2025'},
    {'image': 'assets/icons/langchain.png', 'title': 'LangChain', 'year': '2025'},
    {'image': 'assets/icons/fastapi.png', 'title': 'FastApi', 'year': '2024'},
    {'image': 'assets/icons/huggingface.png', 'title': 'HuggingFace', 'year': '2025'},
  ];

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
            "Skills",
            style: AppTextStyles.KjosefinSansSemiBold.copyWith(
              fontSize: Responsive.getValue(
                context,
                mobile: 48,
                tablet: 100,
                desktop: 200,
              ),
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          
          SizedBox(height: Responsive.getValue(context, mobile: 30, tablet: 40, desktop: 50)),
          
          // Responsive Skills Grid
          LayoutBuilder(
            builder: (context, constraints) {
              // Responsive column count
              final crossAxisCount = Responsive.getValue(
                context,
                mobile: 2,
                tablet: 3,
                desktop: 4,
              );

              // Calculate max width for grid
              final maxWidth = Responsive.getValue(
                context,
                mobile: constraints.maxWidth,
                tablet: 700.0,
                desktop: 900.0,
              );

              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: GridView.builder(
                    shrinkWrap: true, // Allow grid to size itself
                    physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                    itemCount: skills.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: Responsive.getValue(context, mobile: 12, tablet: 16, desktop: 20),
                      mainAxisSpacing: Responsive.getValue(context, mobile: 12, tablet: 16, desktop: 20),
                      childAspectRatio: Responsive.getValue(context, mobile: 2.5, tablet: 2.5, desktop: 2.5),
                    ),
                    itemBuilder: (context, index) {
                      return SkillWidget(
                        imagePath: skills[index]['image']!,
                        title: skills[index]['title']!,
                        year: skills[index]['year']!,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
