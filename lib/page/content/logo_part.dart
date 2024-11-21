import 'package:flutter/material.dart';

class LogoPart extends StatefulWidget {
  const LogoPart({super.key});

  @override
  State<LogoPart> createState() => _LogoPartState();
}

class _LogoPartState extends State<LogoPart> {
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
          DownArrow(),
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
    List<String> strList = ["Little Space Dust", "작은 우주 먼지", "작 우 먼", "L S D"];
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
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      enabled: false,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: "pixel_dung",
        fontSize: 50,
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
      await Future.delayed(Duration(milliseconds: 700));
      setState(() {
        _padding -= _gap;
      });
      await Future.delayed(Duration(milliseconds: 700));
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
        duration: Duration(milliseconds: 700),
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
