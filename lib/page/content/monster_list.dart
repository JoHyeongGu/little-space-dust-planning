import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/tool/clickable_image.dart';

List<Widget> mosterList(BuildContext context) => [
      Padding(
        padding: const EdgeInsets.only(
          top: 100,
          bottom: 50,
        ),
        child: Text(
          "괴물 리스트",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 20 < 30
                ? MediaQuery.of(context).size.width / 20
                : 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "pixel_dung",
          ),
        ),
      ),
      const MonsterDescription(
        name: "잘못된 에너지",
        path: "wrong_ouns.gif",
        description:
            "잘못 합쳐져 괴물이 되려고 하는 온스 조각.\n따로 공격을 하지는 않지만 표면이 뾰족 하여, 접촉 시 에너지를 잃는다.",
      ),
      const MonsterDescription(
        name: "옥토 슬라임",
        path: "space_slime.gif",
        description:
            "촉수가 달린 액체 괴물.\n죽이면 분열 하여 작은 크기의 여러 마리가 된다.\n몸통 가운데 커다란 입이 달렸는데 입에서 액체 포를 발사한다\n눈이 없지만 온스 에너지의 느낌을 느낄 수 있다.",
      ),
      const MonsterDescription(
        name: "우주 용",
        path: "space_dragon.gif",
        description:
            "우주에 사는 어둠의 용.\n알인 상태로 스폰 되고 일정 시간이 지나고 알에서 깨어나 온스 조각을 향해 돌진 하여 공격 한다.\n너무 강력 해서 알에서 깨어나기 전 처치 하는 것을 추천 한다.",
      ),
    ];

class MonsterDescription extends StatelessWidget {
  final String path;
  final String name;
  final String description;

  const MonsterDescription({
    super.key,
    required this.name,
    required this.path,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClickableImage("assets/enemies/$path"),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25 < 25
                        ? MediaQuery.of(context).size.width / 25
                        : 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "pixel_dung",
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 35 < 20
                        ? MediaQuery.of(context).size.width / 35
                        : 20,
                    fontFamily: "pixel_gal",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
