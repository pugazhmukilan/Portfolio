import 'package:flutter/material.dart';
import 'package:portfolio/widgets/skills/skills.dart';


class SkillsGridPage extends StatelessWidget {
  SkillsGridPage({Key? key}) : super(key: key);

  final List<Map<String, String>> skills = [
    {'image': 'assets/images/python.png', 'title': 'Python', 'year': '2020'},
    {'image': 'assets/images/sql.png', 'title': 'SQL', 'year': '2020'},
    {'image': 'assets/images/github.png', 'title': 'GitHub', 'year': '2021'},
    {'image': 'assets/images/dart.png', 'title': 'Dart', 'year': '2022'},
    {'image': 'assets/images/java.png', 'title': 'Java', 'year': '2022'},
    {'image': 'assets/images/flutter.png', 'title': 'Flutter', 'year': '2022'},
    {'image': 'assets/images/git.png', 'title': 'Git', 'year': '2022'},
    {'image': 'assets/images/uiux.png', 'title': 'UI/UX', 'year': '2022'},
    {'image': 'assets/images/firebase.png', 'title': 'FireBase', 'year': '2023'},
    {'image': 'assets/images/figma.png', 'title': 'Figma', 'year': '2023'},
    {'image': 'assets/images/fastapi.png', 'title': 'Fast API', 'year': '2024'},
    {'image': 'assets/images/sklearn.png', 'title': 'Sklearn', 'year': '2024'},
    {'image': 'assets/images/numpy.png', 'title': 'Numpy', 'year': '2024'},
    {'image': 'assets/images/postgresql.png', 'title': 'Postgre SQL', 'year': '2024'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: skills.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Adjust the number of columns as needed
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2, // Adjust to control the shape of each cell
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
  }
}
