import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final void Function()? onPressed;

  CustomButton({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shadowColor: Color.fromARGB(0, 198, 219, 6),
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: Container(
        height: 50,
        width: 280,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
