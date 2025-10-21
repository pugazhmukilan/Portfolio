import 'package:flutter/material.dart';
import 'package:portfolio/ScollingPage.dart';
import 'package:portfolio/constants/Colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldbg,
        primaryColor: AppColors.primary,
        // You can add more theme properties here if needed
      ),
      home: ScrollingPage(),
    );
  }
}

