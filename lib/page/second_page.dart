import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
              fontFamily: "pixel",
            ),
          ),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset("assets/just_dust.png"),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset("assets/chat_dust.png"),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset("assets/ui_dust.png"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Image.asset("assets/lighting_star.gif")),
              const Flexible(
                flex: 2,
                child: Text(
                  "자신보다 작은 먼지들을 먹어서 몸집을 키울 수 있다.\n작은 먼지 9개당 픽셀 하나이며,\n1픽셀 수집 시 자신의 몸에 붙일 수 있다.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
