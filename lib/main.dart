import 'package:flutter/material.dart';
import 'package:portfolio/ScollingPage.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:portfolio/widgets/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isLoading = true;

  void _onLoadingComplete() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldbg,
        primaryColor: AppColors.primary,
      ),
      home: _isLoading
          ? SplashScreen(onLoadingComplete: _onLoadingComplete)
          : ScrollingPage(),
    );
  }
}

