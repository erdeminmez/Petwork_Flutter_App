import 'package:flutter/material.dart';
import 'package:petwork/responsive/mobile_screen_layout.dart';
import 'package:petwork/responsive/responsive_layout_screen.dart';
import 'package:petwork/responsive/web_screen_layout.dart';
import 'package:petwork/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petwork',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}