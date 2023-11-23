import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/ticket/ticketBack.dart';
import 'package:poppinroadcimema/Screens/ticket/ticketFront.dart'; 

class MovingCardWidget extends StatefulWidget {

  const MovingCardWidget({super.key, 
  });

  @override
  _MovingCardWidgetState createState() => _MovingCardWidgetState();
}

class _MovingCardWidgetState extends State<MovingCardWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isFront = true;
  double horizontalDrag = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Add a call to setImageSide() to start rotating the card immediately
    setImageSide();

    // Add a Future.delayed call to delay the rotation until after the widget has been built
    Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      for (int i = 0; i < 3; i++) {
        // Change the loop condition to iterate three times
        if (isFront) {
          horizontalDrag = 0;
        } else {
          horizontalDrag = 180;
        }

        animation =
            Tween<double>(begin: horizontalDrag, end: 360).animate(controller)
              ..addListener(() {
                setState(() {
                  horizontalDrag = animation.value;
                  setImageSide(); // Call the function again to continue rotating
                });
              });
        controller.forward();

        await Future.delayed(const Duration(
            seconds: 1)); // Wait for one second before rotating again
      }
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onHorizontalDragStart: (details) {
          controller.reset();

          setState(() {
            isFront = true;
            horizontalDrag = 0;
          });
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            horizontalDrag += details.primaryDelta!;
            horizontalDrag %= 360;

            setImageSide();
          });
        },
        onHorizontalDragEnd: (details) {
          final double end = 360 - horizontalDrag >= 180 ? 0 : 360;

          animation =
              Tween<double>(begin: horizontalDrag, end: end).animate(controller)
                ..addListener(() {
                  setState(() {
                    horizontalDrag = animation.value;
                    setImageSide();
                  });
                });
          controller.forward();
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(horizontalDrag / 180 * pi),
          alignment: Alignment.center,
          child: isFront
              ? TicketFront()
              : Transform(
                  transform: Matrix4.identity()..rotateY(pi),
                  alignment: Alignment.center,
                  child: TicketBack(),
                ),
        ),
      );

  void setImageSide() {
    if (horizontalDrag <= 90 || horizontalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
