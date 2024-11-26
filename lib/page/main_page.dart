import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/page/content/logo_part.dart';
import 'package:little_space_dust_planning/page/content/in_game_image.dart';
import 'package:little_space_dust_planning/page/content/monster_list.dart';
import 'package:little_space_dust_planning/page/content/story_line.dart';
import 'package:little_space_dust_planning/page/content/summery_describe.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoPart(),
              const SummeryDescribe(),
              ...storyLineWidgetList(context),
              ...mosterList(context),
              const InGameImage(),
            ],
          ),
        ),
      ),
    );
  }
}
