import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImageList extends StatefulWidget {
  final List<String> imgList;
  final double width;
  final double? height;

  const ImageList(
    this.imgList, {
    super.key,
    required this.width,
    this.height,
  });

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  late ScrollController controller;
  final double itemGap = 10;

  List<Widget> parsingToWidget() {
    List<Widget> result = [];
    for (String img in widget.imgList) {
      Widget imgWidget = ImgItem(img, width: widget.width);
      result.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: itemGap),
        child: imgWidget,
      ));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController(
      initialScrollOffset: itemGap,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? widget.width * 0.6,
      width: widget.width,
      child: Stack(
        children: [
          ListView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: parsingToWidget(),
          ),
          ImgMenu(
            controller,
            widget.imgList,
            width: widget.width + itemGap * 2,
          ),
        ],
      ),
    );
  }
}

class ImgItem extends StatelessWidget {
  final String img;
  final double width;
  const ImgItem(
    this.img, {
    super.key,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Image.asset(
        img,
        fit: BoxFit.contain,
      ),
    );
  }
}

class ImgMenu extends StatefulWidget {
  final ScrollController controller;
  final List<String> imgList;
  final double width;
  const ImgMenu(
    this.controller,
    this.imgList, {
    super.key,
    required this.width,
  });

  @override
  State<ImgMenu> createState() => _ImgMenuState();
}

class _ImgMenuState extends State<ImgMenu> {
  static const double VISIBLE = 0.7;
  static const double INVISIBLE = 0;
  late Duration speed;
  late double opacity;
  late double scrollDir;
  int index = 0;

  Future<void> scroll({bool prev = false}) async {
    index += prev ? -1 : 1;
    if (index < 0) {
      index = widget.imgList.length - 1;
    } else if (index >= widget.imgList.length) {
      index = 0;
    }
    double pos = index * widget.width + widget.controller.initialScrollOffset;
    widget.controller.animateTo(
      pos,
      duration: speed,
      curve: Curves.decelerate,
    );
  }

  void zoomImage() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTapUp: (details) {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: ImgItem(widget.imgList[index]),
            ),
          ),
        );
      },
    );
  }

  Widget zoomBtn() {
    return IconButton(
      onPressed: zoomImage,
      iconSize: widget.width / 10,
      icon: const Icon(
        color: Colors.white,
        Icons.zoom_in,
      ),
    );
  }

  Widget changePage({required bool prev}) {
    if (widget.imgList.length <= 1) return Container();
    return IconButton(
      onPressed: () {
        scroll(prev: prev);
      },
      iconSize: widget.width / 16,
      icon: Icon(
        prev ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    speed = const Duration(milliseconds: 600);
    opacity = INVISIBLE;
    scrollDir = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) {
        setState(() {
          opacity = VISIBLE;
        });
      },
      onExit: (detalis) {
        setState(() {
          opacity = INVISIBLE;
        });
      },
      child: GestureDetector(
        onDoubleTap: () {
          zoomImage();
        },
        onHorizontalDragEnd: (details) {
          scroll(prev: scrollDir > 0);
        },
        onHorizontalDragUpdate: (details) {
          scrollDir = details.delta.dx;
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: opacity,
          child: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                changePage(prev: true),
                zoomBtn(),
                changePage(prev: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
