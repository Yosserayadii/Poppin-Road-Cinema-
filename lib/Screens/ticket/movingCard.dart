import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/ticket/ticketBack.dart';
import 'package:poppinroadcimema/Screens/ticket/ticketFront.dart';

class MovingCardWidget extends StatefulWidget {
  final Movie movie;
  const MovingCardWidget({
    super.key,
    required this.movie,
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

    // Initialize the animation with the correct initial value
    animation = Tween<double>(begin: 0, end: 360).animate(controller)
      ..addListener(() {
        setState(() {
          horizontalDrag = animation.value;
          setImageSide(); // Call the function again to continue rotating
        });
      });

    // Start the animation immediately
    controller.forward();
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
          final double end =
              (360 - horizontalDrag >= 180) ? 0 : 360; // Adjust the condition

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
              ? TicketFront(movie: widget.movie)
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
