import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/tool/clickable_image.dart';

class StoryLine extends StatelessWidget {
  const StoryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/summery_des/pixel_space_2.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black,
                ],
              ),
            ),
          ),
          const StoryContent(),
        ],
      ),
    );
  }
}

class StoryContent extends StatelessWidget {
  const StoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "배경 이야기",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "pixel_dung",
          ),
        ),
        const SizedBox(height: 50),
        Flexible(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ClickableImage("assets/story_line/separate_god.jpg"),
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          '''
    먼 옛날, 우주는 단 하나의 신에 의해 유지되고 있었습니다. 
    그 신은 "온스"(Ouns)라 불리며 우주 그 자체와도 같았고, 
    생명과 에너지를 창조하고 균형을 이루는 존재였습니다. 
    그러나 알 수 없는 이유로 온스(Ouns)는 스스로 붕괴하며, 수많은 조각으로 산산조각 나고 말았습니다. 
    신의 조각들은 우주의 곳곳으로 흩어졌고, 그 중 일부는 신의 에너지를 머금은 채 각기 다른 형태로 변이되었습니다. 
    이 중 움직이기 시작한 작은 에너지 조각, 이는 마치 우주에 떠다니는 먼지와도 같았습니다. 
    “에너지 조각을 모아야 한다. 그래야만 우주를 구할 수 있다.” 
    작은 우주 먼지는 끝없는 모험을 시작하게 됩니다.
          ''',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: "pixel_gal",
          ),
        ),
        const SizedBox(height: 70),
        Flexible(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ClickableImage(
                  "assets/story_line/Space_Monster_concept.webp",
                ),
              ),
              Flexible(
                child: ClickableImage(
                  "assets/story_line/monsters.jpg",
                ),
              ),
              Flexible(
                child: ClickableImage(
                  "assets/story_line/see_light_monster.jpg",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          '''
    모험은 순탄치 않았습니다.
    온 우주에 온스(Ouns)의 빛이 사라지자, 우주 곳곳에는 에너지를 잡아먹는 괴물들이 생겨났고
    작은 우주 먼지는 괴물을 피해 에너지를 모아서,
    우주에 빛을 가져다 줄 수 있는 새로운 온스(Ouns)가 되어야 합니다.   
          ''',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: "pixel_gal",
          ),
        ),
      ],
    );
  }
}
