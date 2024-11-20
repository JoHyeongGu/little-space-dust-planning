import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/page/first_page.dart';
import 'package:little_space_dust_planning/page/logo_page.dart';
import 'package:little_space_dust_planning/page/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoPage(),
            FirstPage(),
            SecondPage(),
          ],
        ),
      ),
    );
  }
}
