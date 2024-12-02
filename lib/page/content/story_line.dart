import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/tool/global_key_manager.dart';
import 'package:little_space_dust_planning/tool/image_list.dart';
import 'package:little_space_dust_planning/tool/text_tool.dart';
import 'package:provider/provider.dart';

const String title = "배경 스토리";

// Scene 1
const List<String> imgListA = ["assets/story_line/separate_god.jpg"];
const String contentA = '''
먼 옛날, 우주에는 온스라는 유일한 존재만이 있었습니다.
온스는 모든 것의 근원이 되는 무한한 에너지였고, 우주 자체였습니다. 
시간과 공간의 개념조차 존재하지 않는, 텅 빈 무한의 공간에서 온스는 영원히 존재했습니다. 
하지만 알 수 없는 이유로 온스는 균열되기 시작하고, 그 거대한 에너지는 폭발하듯 우주 곳곳으로 흩어져 갔습니다.
''';

// Scene 2
const List<String> imgListB = [
  "assets/story_line/spread_energy_1.png",
  "assets/story_line/spread_energy_2.png",
  "assets/story_line/spread_energy_3.png",
  "assets/story_line/spread_energy_4.png",
];
const String contentB = '''
온스의 에너지가 폭발하면서 시간과 공간이 생겨나고, 우주는 급격하게 팽창하기 시작했습니다. 
흩어진 에너지는 곳곳에서 응축되며 별, 행성, 블랙홀, 그리고 다양한 생명체를 탄생시켰습니다. 
''';

// Scene 3
const List<String> imgListC = [
  "assets/story_line/dark_ouns.png",
  "assets/story_line/dark_energy.png",
  "assets/story_line/dark_octo.png",
  "assets/story_line/dark_goblin.png",
];
const String contentC = '''
하지만 온스의 순수한 에너지가 흩어지면서 불안정한 조각들이 생겨났고, 
이 조각들은 점차 어둠을 잉태하기 시작했습니다. 
빛과 어둠, 질서와 혼돈이 뒤섞이며 우주는 불안정한 상태에 놓이게 되었고, 빛을 탐식하는 어둠의 존재들이 등장하기 시작했습니다. 
이들은 빛을 에너지원으로 삼아 번성했고, 빛의 존재들을 위협하며 우주를 어둠으로 물들이려 했습니다.
''';

// Scene 4
const List<String> imgListD = [
  "assets/story_line/light_1.png",
  "assets/story_line/light_2.png",
  "assets/story_line/light_3.png",
  "assets/story_line/light_4.png",
  "assets/story_line/light_5.png",
  "assets/story_line/light_6.png",
];
const String contentD = '''
긴 시간이 흘러, 온스의 에너지로 수없이 많은 생명체들이 끊임없이 생기던 중,
어떠한 어둠도 섞이지 않고 순수한 온스 에너지만으로 아주 작은 먼지 만한 생명체가 탄생했습니다.
작은 먼지는 에너지를 모아 점점 커질 수 있는 능력을 갖고 있었고
작은 먼지는 이 능력을 통해 세상을 다시 빛으로 채우고 싶은 본능에 따라 여행을 떠나게 떠나게 됩니다.
''';

class StoryLine extends StatefulWidget {
  const StoryLine({super.key});

  @override
  State<StoryLine> createState() => _StoryLineState();
}

class _StoryLineState extends State<StoryLine> {
  late GlobalKey key;
  late String id;

  @override
  void initState() {
    super.initState();
    key = GlobalKey();
    id = "배경 스토리";
    context.read<GlobalKeyManager>().registerKey(id, key);
  }

  List<Widget> scene(
          BuildContext context, List<String> imgList, String content) =>
      [
        ImageList(imgList, width: MediaQuery.of(context).size.width * 0.5),
        const SizedBox(height: 30),
        contentText(context, content),
        const SizedBox(height: 15),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            titleText(context, title),
            const SizedBox(height: 50),
            ...scene(context, imgListA, contentA),
            ...scene(context, imgListB, contentB),
            ...scene(context, imgListC, contentC),
            ...scene(context, imgListD, contentD),
          ],
        ),
      ),
    );
  }
}
