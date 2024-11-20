import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
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
              "assets/pixel_space.png",
              fit: BoxFit.fitHeight,
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
        fontFamily: "pixel",
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
