import 'package:flutter/material.dart';

class ParallaxEffect extends StatefulWidget {
  const ParallaxEffect({super.key});

  @override
  State<ParallaxEffect> createState() => _ParallaxEffectState();
}

class _ParallaxEffectState extends State<ParallaxEffect> {
  PageController pageController = PageController(viewportFraction: 0.9);
  double pageOffSet = 0;

  List<String> images = [
    "assets/jw.jpg",
    "assets/orange_clock.jpg",
    "assets/2001.jpg",
    "assets/drive.jpg",
    "assets/leon.jpg",
    "assets/akira.jpg",
    "assets/fc.jpg",
    "assets/pshyco.jpg",
    "assets/pf.jpg",
    "assets/bat.jpg",
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        pageOffSet = pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          double scale =
              (1 - ((pageOffSet - index).abs() * 0.1)).clamp(0.9, 1.0);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 80),
            child: Transform.scale(
              scale: scale,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    width: double.infinity,
                    images[index],
                    fit: BoxFit.fitHeight,
                    alignment: Alignment((index - pageOffSet) * 8, 0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
