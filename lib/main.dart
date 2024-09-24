import 'package:flutter/material.dart';
import 'package:portfolio/ScollingPage.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        body: Center(
          child: ScrollingPage(),
        ),
      ),
    );
  }
}

