import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/page/login_page.dart';
import 'package:little_space_dust_planning/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JONDEA: 게임 기획서',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
