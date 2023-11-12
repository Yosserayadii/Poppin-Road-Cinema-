import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class CinemaScreenPainter extends CustomPainter {
  var strokeWidth = 6.0;
  var offset = 40.0;
  var shadowBlurRadius = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = CustomColors.fifthColor;
    paint.style = PaintingStyle.stroke;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth;

    // Draw the shadow
    var shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5) // Adjust shadow color and opacity
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, shadowBlurRadius); // Adjust blur radius

    var shadowPath = Path();
    shadowPath.moveTo(offset, size.height / 2);
    shadowPath.quadraticBezierTo(
      size.width / 2,
      -size.height + offset,
      size.width - offset,
      size.height / 2,
    );
    shadowPath.lineTo(size.width - offset, size.height - offset);
    shadowPath.quadraticBezierTo(
      size.width / 2,
      size.height - offset,
      offset,
      size.height - offset,
    );

    canvas.drawShadow(
        shadowPath, Color.fromARGB(135, 212, 109, 109), 33.0, true);

    // Draw the curve
    var path = Path();
    path.moveTo(offset, size.height - offset);
    path.quadraticBezierTo(
      size.width / 2,
      -size.height + offset,
      size.width - offset,
      size.height - offset,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
