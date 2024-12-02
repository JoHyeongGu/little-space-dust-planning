import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/page/content/character_list.dart';
import 'package:little_space_dust_planning/page/content/logo_part.dart';
import 'package:little_space_dust_planning/page/content/story_line.dart';
import 'package:little_space_dust_planning/page/content/summery_describe.dart';
import 'package:little_space_dust_planning/page/content/table_list.dart';
import 'package:little_space_dust_planning/tool/global_key_manager.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GlobalKeyManager(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    LogoPart(),
                    SummeryDescribe(),
                    StoryLine(),
                    CharacterList(),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: TableList(),
            ),
          ],
        ),
      ),
    );
  }
}
