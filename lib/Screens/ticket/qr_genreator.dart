import 'package:flutter/material.dart';
import 'package:custom_qr_generator/custom_qr_generator.dart';

class QrGeretor extends StatelessWidget {
  const QrGeretor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomPaint(
      // painter: Painter(),
      painter: QrPainter(
          data:
              'https://firebasestorage.googleapis.com/v0/b/test-54e68.appspot.com/o/tickets%2FDocument1(1).pdf?alt=media&token=4a1ed8a2-6766-449a-890a-f2b2ce29a093',
          options: QrOptions(
              shapes: QrShapes(
                  darkPixel: QrPixelShapeRoundCorners(cornerFraction: 5),
                  frame: QrFrameShapeRoundCorners(
                      cornerFraction: 5, topLeft: true, topRight: false),
                  ball: QrBallShapeRoundCorners(cornerFraction: .25)),
              colors: QrColors(
                background: QrColor.solid(Color.fromARGB(255, 226, 236, 255)),
                dark: QrColorLinearGradient(colors: [
                  Color.fromARGB(255, 247, 1, 17),
                  Color.fromARGB(255, 23, 27, 48)
                ], orientation: GradientOrientation.leftDiagonal),
              ))),
      size: const Size(140, 140),
    ));
  }
}
