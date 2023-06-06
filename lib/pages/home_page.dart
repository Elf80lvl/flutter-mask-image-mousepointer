import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double x = 0.0;
  double y = 0.0;

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onHover: _updateLocation,
      child: Scaffold(
        backgroundColor: const Color(0xff101010),
        body: Stack(
          children: [
            Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: Image.asset(
                'assets/bg-bright.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              child: Container(
                transform: Matrix4.translationValues(
                    x - screenWidth / 2, y - screenHeight / 2, 0.0),
                child: Image.asset(
                  'assets/mask7.png',
                  //fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
