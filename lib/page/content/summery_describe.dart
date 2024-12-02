import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/tool/global_key_manager.dart';
import 'package:little_space_dust_planning/tool/image_list.dart';
import 'package:little_space_dust_planning/tool/text_tool.dart';
import 'package:provider/provider.dart';

const String title = "개요";
const String content = '''
장르: 로그라이크 액션 어드벤쳐
그래픽: 2D 도트
플랫폼: 안드로이드
''';

class SummeryDescribe extends StatefulWidget {
  const SummeryDescribe({super.key});

  @override
  State<SummeryDescribe> createState() => _SummeryDescribeState();
}

class _SummeryDescribeState extends State<SummeryDescribe> {
  late GlobalKey key;
  late String id;
  bool isVertical = false;

  @override
  void initState() {
    super.initState();
    key = GlobalKey();
    id = "개요";
    context.read<GlobalKeyManager>().registerKey(id, key);
  }

  Widget picture() {
    return ImageList(
      const [
        "assets/summery_des/world_concept.webp",
        "assets/summery_des/pixel_world.webp",
        "assets/summery_des/3_world.webp",
      ],
      width: MediaQuery.of(context).size.width * 0.4,
    );
  }

  Widget sortWidget() {
    if (MediaQuery.of(context).size.width <= 700) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleText(context, title),
          const SizedBox(height: 30),
          picture(),
          const SizedBox(height: 30),
          contentText(context, content, textAlign: TextAlign.start)
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          picture(),
          const SizedBox(width: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(context, title),
              const SizedBox(height: 15),
              contentText(context, content, textAlign: TextAlign.start),
            ],
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: sortWidget(),
      ),
    );
  }
}
