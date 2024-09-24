import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    print(kwidth);
    double height = MediaQuery.of(context).size.height;
    double iconWidth = 60.0; // Set a fixed width for icons

    return Container(
      //height:pagewidth,
      child: Column(
        children: [
          
          // const SizedBox(height:30),
          Text("About Me",style:AppTextStyles.KjosefinSansSemiBold.copyWith(fontSize:kwidth>1400? 250: kwidth*0.2,color:Colors.black.withOpacity(0.2))),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset("images/aboutme.png",scale:2),
          ),
          
          
            
          
        
        ],
      ),
    );

  
  }
}