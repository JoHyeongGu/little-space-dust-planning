import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/tool/global_key_manager.dart';
import 'package:little_space_dust_planning/tool/image_list.dart';
import 'package:little_space_dust_planning/tool/text_tool.dart';
import 'package:provider/provider.dart';

const String title = "등장인물";

Map charA = {
  "name": "작은 우주 먼지 (Player)",
  "des": '''
순수한 온스 에너지가 뭉쳐 만들어진 존재. 
어느 날 눈을 떠보니 주변에는 아름다운 빛(온스 에너지)들만 떠다니고 있었다.
에너지를 흡수하여 다양한 형태의 조각으로 만들어 몸에 붙일 수 있다.
공격 에너지 조각 없이는 어떠한 공격도 할 수 없다..''',
  "imgList": [
    "assets/player/1.png",
    "assets/player/2.png",
    "assets/player/3.png",
    "assets/player/4.png",
    "assets/player/5.png",
    "assets/player/6.png",
    "assets/player/7.png",
    "assets/player/8.png",
    "assets/player/9.png",
    "assets/player/10.png",
    "assets/player/11.png",
  ],
};

Map charB = {
  "name": "오염된 온스 조각 (Enemy)",
  "des": '''
1 스테이지에 등장하는 기본 적.
생명이 없는 어둠에 잠식 당한 온스 에너지 집합체 이다.
따로 공격은 하지 않지만, 순수한 온스 에너지를 느끼면
자석처럼 본능적으로 다가가고 온스에너지를 분해하여 흡수한다.
표면이 뾰족하여 온스에너지가 닿으면 분해될 것이다.''',
  "imgList": [
    "assets/enemies/dark_ouns_2.png",
    "assets/enemies/dark_ouns_1.png",
    "assets/enemies/dark_ouns_3.png",
    "assets/enemies/dark_ouns_4.png",
    "assets/enemies/dark_ouns_5.png",
    "assets/enemies/dark_ouns.gif",
  ],
};

Map charC = {
  "name": "디서넌스 (Boss)",
  "des": '''
1 스테이지에 등장하는 보스
어둠의 조각이 한 순수한 온스 조각을 침식 시키려다가 실패하였지만
그 상태로 진화하여 새로운 모양을 하고 있다.
순수한 온스 조각은 어둠에 오염되어 회색빛의 오염된 온스 조각이 돼버렸다.
3가지 공격 패턴을 갖고 있다. (어둠: 블랙홀 소환, 하양: 몸통 박치기, 필살기: 회전 토네이도)
처음에는 각각 공격하다가 피가 얼마 안남았을 때는 서로 더 얽히며 회전하며 필살기를 사용한다.
(* Dissonance는 불협화음이라는 뜻을 갖고 있는 영어단어이다.)''',
  "imgList": [
    "assets/enemies/dissonance_1.png",
    "assets/enemies/dissonance_2.png",
    "assets/enemies/dissonance_3.png",
    "assets/enemies/dissonance_4.png",
    "assets/enemies/dissonance_5.png",
    "assets/enemies/dissonance_6.png",
    "assets/enemies/dissonance_7.png",
    "assets/enemies/dissonance_8.png",
    "assets/enemies/dissonance_9.png",
  ],
};

Map charD = {
  "name": "콜렉터 (Enemy)",
  "des": '''
2 스테이지에 등장하는 적 (아직 확정 X)
온스에너지로 만들어진 생명체 군집이다.
문명이 상당히 발전해서 자신들의 근원을 아주 잘 알고 있고
온스에너지를 수집하여 자원으로 사용한다.
우주를 탐색하던 중 생명을 갖고 있는 순수한 온스 에너지 조각이 있다는 사실을 알게되고
이를 수집하러 콜렉터들이 우주를 돌아다닌다.
우주선을 타고 다니며 여러 마리씩 돌아다닌다.
공격은 레이저 광선을 발사한다.''',
  "imgList": [
    "assets/enemies/collector.png",
    "assets/enemies/collector_1.png",
    "assets/enemies/collector_2.png",
    "assets/enemies/collector_3.png",
    "assets/enemies/collector_4.png",
  ],
};

Map charE = {
  "name": "더미 (Enemy)",
  "des": '''
더미(Dummy)는 많은 물건이 한데 모인 큰 덩어리. 뭔가가 쌓인 것을 말하는 한국어 단어이다.
액체 형태의 괴물로 이 또한 온스 에너지로 만들어진 괴물이다.
입에서 자신의 몸과 같은 재질의 덩어리를 발사하고,
죽이면 4분할 하고, 게임 초반에는 새끼 더미 부터 출현 시켜서 분할 기능은 못하게 하는 게 좋을 듯 싶다.
눈이 없고 입만 달려서 에너지를 느끼며 돌아다닌다.''',
  "imgList": [
    "assets/enemies/dummy_1.png",
    "assets/enemies/dummy_2.png",
    "assets/enemies/dummy.gif",
  ],
};

Map charF = {
  "name": "보알로 (Enemy)",
  "des": '''
우주에 탄생한 용. 
어둠 에너지로 만들어졌다. (사실 어둠 에너지도 온스 에너지에서 파생된 에너지임)
처음에는 알 상태로 스폰 되는데 알에서 깨어나면 용의 형태로 
플레이어를 향해 돌진한다. 스피드가 빨라서 알 상태에서 죽이는 것을 추천한다.
(* Voallo는 짜잔 이라는 뜻의 voala 에서 파생된 이름이다. )''',
  "imgList": [
    "assets/enemies/voallo_1.png",
    "assets/enemies/voallo_2.png",
    "assets/enemies/voallo.gif",
  ],
};

Map charG = {
  "name": "온스 (Story)",
  "des": '''
스토리 상에만 등장하는 온스(ouns)
아무것도 없는 공허 속에 혼자 존재하다가
스스로 파멸하여 밝은 빛으로 이루어져 있던 온스의 조각들은
우주로 퍼지며 어둠 에너지를 만들고 밝은 온스 에너지도 만들게 되었다.
  ''',
  "imgList": [
    "assets/enemies/ouns_1.png",
    "assets/enemies/ouns_2.png",
    "assets/enemies/ouns_3.png",
    "assets/enemies/ouns_4.png",
  ],
};

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late GlobalKey key;
  late String id;

  @override
  void initState() {
    super.initState();
    key = GlobalKey();
    id = "등장인물";
    context.read<GlobalKeyManager>().registerKey(id, key);
  }

  Widget character(BuildContext context, Map info) {
    double width = MediaQuery.of(context).size.width / 3;
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageList(info["imgList"], width: width),
          const SizedBox(width: 30),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(context, info["name"], maxSize: 20),
                const SizedBox(height: 20),
                contentText(context, info["des"], textAlign: TextAlign.start),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            titleText(context, title),
            const SizedBox(height: 50),
            character(context, charA),
            character(context, charB),
            character(context, charC),
            character(context, charD),
            character(context, charE),
            character(context, charF),
            character(context, charG),
          ],
        ),
      ),
    );
  }
}
