import 'package:flutter/material.dart';

class ClickableImage extends StatefulWidget {
  final String image;
  const ClickableImage(this.image, {super.key});

  @override
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {
  Widget imageFrame() => Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(horizontal: 30),
    child: Image.asset(widget.image),
  );

  void zoomImage() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: GestureDetector(
            onTapUp: (details) {
              Navigator.of(context).pop();
            },
            child: imageFrame(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        zoomImage();
      },
      child: imageFrame(),
    );
  }
}
