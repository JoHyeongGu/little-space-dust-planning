import 'package:flutter/material.dart';

class SummeryDescribe extends StatelessWidget {
  const SummeryDescribe({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
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
                  ...List.filled(2, Colors.black.withOpacity(0.4)),
                  Colors.black,
                ],
              ),
            ),
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
                      Flexible(
                        child: Text(
                          '"에너지를 모아 힘을 키우는\n작은 우주먼지"',
                          style: TextStyle(
                            fontSize:
                                size.width / 25 < 25 ? size.width / 25 : 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "pixel_dung",
                          ),
                        ),
                      ),
                      const Flexible(child: SizedBox(height: 50)),
                      Flexible(
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 340,
                          ),
                          child: Text(
                            "장르: 뱀서라이크\n그래픽: 2D 도트\n플랫폼: 안드로이드\n조작 방식: 터치 조이스틱을 활용하여\n캐릭터를 움직인다.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  size.width / 35 < 20 ? size.width / 35 : 20,
                              fontFamily: "pixel_gal",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/summery_des/moving_little_space_dust.gif",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
