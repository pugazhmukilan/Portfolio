import 'package:flutter/material.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:portfolio/constants/Text_Styles.dart';
import 'package:portfolio/widgets/CheckResumeButton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double iconWidth = 60.0; // Set a fixed width for icons

    return Wrap(
      children: [Container(
        //height:pagewidth,
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(radius: 50, backgroundColor: Colors.grey),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Pugazh Mukilan",
                style: AppTextStyles.KjosefinSansRegular.copyWith(
                    fontSize: width < 1400 ? width * 0.1 : 150),
              ),
            ),
            Text(
              "Building Software product and \n making life easy",
              style: AppTextStyles.KjostRegular.copyWith(
                  fontSize: width > 700 ? 16 : width * 0.02),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: width > 1400 ? 3 : 12),
            CheckResumeButton(),
            SizedBox(height: 120),
            Container(
              width: width>1400? 600: width * 0.6,
              color: Colors.transparent,
              child: MarqueeList(
                
                scrollDirection: Axis.horizontal,
                scrollDuration: Duration(seconds: 3),
                children: [
                  iconImage(iconWidth),
                  iconImage(iconWidth, 'assets/icons/flutter.png'),
                  iconImage(iconWidth, 'assets/icons/firebase.png'),
                  iconImage(iconWidth, 'assets/icons/fastapi.png'),
                  iconImage(iconWidth, 'assets/icons/git.png'),
                  iconImage(iconWidth, 'assets/icons/github.png'),
                  iconImage(iconWidth, 'assets/icons/java.png'),
                  iconImage(iconWidth, 'assets/icons/python.png'),
                  iconImage(iconWidth, 'assets/icons/postgres.png'),
                  iconImage(iconWidth, 'assets/icons/uiux.png'),
                  iconImage(iconWidth, 'assets/icons/sql.png'),
                  iconImage(iconWidth, 'assets/icons/sklearn.png'),
                  iconImage(iconWidth, 'assets/icons/flutter.png'),
                  iconImage(iconWidth, 'assets/icons/firebase.png'),
                  iconImage(iconWidth, 'assets/icons/fastapi.png'),
                  iconImage(iconWidth, 'assets/icons/git.png'),
                  iconImage(iconWidth, 'assets/icons/github.png'),
                  iconImage(iconWidth, 'assets/icons/java.png'),
                  iconImage(iconWidth, 'assets/icons/python.png'),
                  iconImage(iconWidth, 'assets/icons/postgres.png'),
                  iconImage(iconWidth, 'assets/icons/uiux.png'),
                  iconImage(iconWidth, 'assets/icons/sql.png'),
                  iconImage(iconWidth, 'assets/icons/sklearn.png'),
                ],
              ),
            ),
          ],
        ),
      ),]
    );
  }

  Widget iconImage(double width, [String assetPath = 'assets/icons/dart.png']) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: Image.asset(assetPath, fit: BoxFit.contain),
      ),
    );
  }
}
