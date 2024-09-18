import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart';
import 'package:portfolio/widgets/skills/skills.dart';

class SkillsPages extends StatefulWidget {
  const SkillsPages({super.key});

  @override
  State<SkillsPages> createState() => _SkillsPagesState();
}

class _SkillsPagesState extends State<SkillsPages> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
    ];

    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      constraints: BoxConstraints(
         // Ensure minimum height
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Skills",
            style: AppTextStyles.KjosefinSansSemiBold.copyWith(
              fontSize: kwidth > 1400 ? 250 : kwidth * 0.2,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              height:400,
              width:800,
              child: GridView.builder(
                itemCount: skills.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: kwidth >700 ? 4 :3, // Adjust the number of columns as needed
                  crossAxisSpacing:20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2.5, // Adjust to control the shape of each cell
                ),
                itemBuilder: (context, index) {
                  return Wrap(
                    
                    children:[Expanded(
                      child: SkillWidget(
                                        imagePath: skills[index]['image']!,
                                        title: skills[index]['title']!,
                                        year: skills[index]['year']!,
                                      ),
                    ),]
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
