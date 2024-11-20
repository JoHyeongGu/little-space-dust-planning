import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/color.dart';
import 'package:little_space_dust_planning/page/main_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Map loginData = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CUSTOM_GREEN,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LockIcon(loginData),
            const SizedBox(height: 30),
            InputBar(loginData),
          ],
        ),
      ),
    );
  }
}

class LockIcon extends StatefulWidget {
  LockIcon(this.loginData, {super.key});
  Map loginData;

  @override
  State<LockIcon> createState() => _LockIconState();
}

class _LockIconState extends State<LockIcon> {
  double _padding = 0;

  void wrong() async {
    setState(() {
      _padding = 30;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _padding = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.loginData["wrong"] = wrong;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceInOut,
      padding: EdgeInsets.only(bottom: _padding),
      child: const Icon(
        Icons.lock_outlined,
        size: 100,
        color: CUSTOM_IVORY,
      ),
    );
  }
}

class InputBar extends StatefulWidget {
  InputBar(this.loginData, {super.key});
  Map loginData = {};

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final TextEditingController _controller = TextEditingController();
  double height = 50;


  void right() async {
    document.cookie = 'login=pass; max-age=2592000;';
    _controller.text = "";
    List<String> welcomeMents = [
      "환영합니다 콘노.",
      "오셨군요, 환영합니다.",
      "바로 통과 시켜드리겠습니다.",
      "안농 콘노~!",
      "화이팅이다!!",
      "반갑구먼요~~",
      "콘노 모해~~?",
    ];
    int randomIndex = Random().nextInt(welcomeMents.length);
    for (String char in welcomeMents[randomIndex].split("")) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _controller.text += char;
      });
    }
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _controller.text = "";
      height = 0;
    });
    await Future.delayed(const Duration(milliseconds: 550));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // document.cookie = null;
    widget.loginData["right"] = right;
    if (document.cookie != null && document.cookie!.contains("pass")) right();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
        width: MediaQuery.of(context).size.width / 3,
        height: height,
        decoration: BoxDecoration(
            color: CUSTOM_IVORY, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Input the Password",
            hintFadeDuration: const Duration(milliseconds: 500),
            hintStyle: TextStyle(
              color: Colors.blueGrey.shade400,
            ),
          ),
          style: TextStyle(
            color: Colors.blueGrey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 23,
            letterSpacing: 0.1,
            fontFamily: "pixel",
          ),
          cursorColor: Colors.blueGrey,
          cursorHeight: 25,
          onEditingComplete: () {
            if (_controller.text == "little_space_dust") {
              widget.loginData["right"]();
            } else {
              widget.loginData["wrong"]();
            }
          },
        ),
      ),
    );
  }
}
