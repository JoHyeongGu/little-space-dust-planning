import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:little_space_dust_planning/tool/global_key_manager.dart';

class LogoPart extends StatefulWidget {
  const LogoPart({super.key});

  @override
  State<LogoPart> createState() => _LogoPartState();
}

class _LogoPartState extends State<LogoPart> {
  late GlobalKey key;
  late String id;

  @override
  void initState() {
    super.initState();
    key = GlobalKey();
    id = "로고";
    context.read<GlobalKeyManager>().registerKey(id, key);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/logo_part/pixel_space.png",
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/summery_des/pixel_space_2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),
          const Center(
            child: Logo(),
          ),
          const DownArrow(),
        ],
      ),
    );
  }
}

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  final TextEditingController _controller = TextEditingController();

  void textAnimating() async {
    List<String> strList = [
      "Little Space Dust",
      "작은 우주 먼지",
    ];
    while (true) {
      for (String str in strList) {
        for (String char in str.split("")) {
          setState(() {
            _controller.text += char;
          });
          await Future.delayed(const Duration(milliseconds: 100));
        }
        await Future.delayed(const Duration(seconds: 3));
        for (String char in str.split("")) {
          String text = _controller.text;
          setState(() {
            _controller.text = text.substring(0, text.length - 1);
          });
          await Future.delayed(const Duration(milliseconds: 50));
        }
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    textAnimating();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 13;
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      enabled: false,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "pixel_dung",
        fontSize: fontSize < 50 ? fontSize : 50,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class DownArrow extends StatefulWidget {
  const DownArrow({super.key});

  @override
  State<DownArrow> createState() => _DownArrowState();
}

class _DownArrowState extends State<DownArrow> {
  double _padding = 30;

  void animating() async {
    double _gap = 10;
    while (true) {
      setState(() {
        _padding += _gap;
      });
      await Future.delayed(const Duration(milliseconds: 700));
      setState(() {
        _padding -= _gap;
      });
      await Future.delayed(const Duration(milliseconds: 700));
    }
  }

  @override
  void initState() {
    super.initState();
    animating();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        padding: EdgeInsets.only(bottom: _padding),
        child: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.white.withOpacity(0.4),
          size: 70,
        ),
      ),
    );
  }
}
