import 'package:flutter/material.dart';

class ClickableImage extends StatefulWidget {
  final String image;
  final bool onFrame;
  const ClickableImage(this.image, {super.key, this.onFrame = false});

  @override
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {
  Widget imageFrame({BuildContext? context}) => Container(
        decoration: BoxDecoration(
          color: widget.onFrame
              ? Colors.white.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        constraints: BoxConstraints(
          maxWidth: context != null
              ? MediaQuery.of(context).size.width / 5
              : double.infinity,
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(widget.image),
        ),
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
      child: imageFrame(context: context),
    );
  }
}
