import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/pixel_space_2.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: Text(
                          '"에너지를 모아 힘을 키우는\n작은 우주먼지"',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "pixel",
                          ),
                        ),
                      ),
                      const Flexible(child: SizedBox(height: 50)),
                      Flexible(
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 340,
                          ),
                          child: const Text(
                            "장르: 뱀서라이크\n그래픽: 2D 도트\n플랫폼: 안드로이드\n조작 방식: 터치 조이스틱을 활용하여 캐릭터를 움직인다.",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                    child: Image.asset("assets/moving_little_space_dust.gif")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
