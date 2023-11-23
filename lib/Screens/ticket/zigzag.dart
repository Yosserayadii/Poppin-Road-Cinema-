import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(37, 4, 159, 180)
      ..strokeWidth = 1.0;

    final double dashLength = 10.0;
    final double gapLength = 5.0;

    double offset = 0.0;
    while (offset < size.width) {
      canvas.drawLine(Offset(offset, size.height / 2),
          Offset(offset + dashLength, size.height / 2), paint);
      offset += dashLength + gapLength;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
