import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/tool/clickable_image.dart';

class InGameImage extends StatelessWidget {
  const InGameImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ...List.filled(5, Colors.black),
            Colors.white,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
      child: Column(
        children: [
          const Text(
            "< 예상 인게임 화면 >",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "pixel_dung",
            ),
          ),
          const SizedBox(height: 50),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ClickableImage(
                  "assets/in_game/just_dust.png",
                  onFrame: true,
                ),
              ),
              Flexible(
                child: ClickableImage(
                  "assets/in_game/chat_dust.png",
                  onFrame: true,
                ),
              ),
              Flexible(
                child: ClickableImage(
                  "assets/in_game/ui_dust.png",
                  onFrame: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Image.asset("assets/in_game/lighting_star.gif")),
              const Flexible(
                flex: 2,
                child: Text(
                  "자신보다 작은 먼지들을 먹어서 몸집을 키울 수 있다.\n작은 먼지 9개당 픽셀 하나이며,\n1픽셀 수집 시 자신의 몸에 붙일 수 있다.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: "pixel_gal",
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
