import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class Genre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double iconSize = constraints.maxWidth / 10;
          double containerSize = iconSize * 2;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildGenreContainer(
                  icon: 'assets/grinning.png',
                  text: 'Comedy',
                  color: const Color.fromRGBO(49, 54, 77, 0.486),
                  containerSize: containerSize,
                  iconSize: iconSize,
                ),
                SizedBox(width: 10),
                _buildGenreContainer(
                  icon: 'assets/love.png',
                  text: 'Romance',
                  color: CustomColors.secondaryColor,
                  containerSize: containerSize,
                  iconSize: iconSize,
                ),
                SizedBox(width: 10),
                _buildGenreContainer(
                  icon: 'assets/bew.png',
                  text: 'Horror',
                  color: CustomColors.secondaryColor,
                  containerSize: containerSize,
                  iconSize: iconSize,
                ),
                SizedBox(width: 10),
                _buildGenreContainer(
                  icon: 'assets/tongue.png',
                  text: 'Drama',
                  color: CustomColors.secondaryColor,
                  containerSize: containerSize,
                  iconSize: iconSize,
                ),
                SizedBox(width: 10),
                _buildGenreContainer(
                  icon: 'assets/tragedy.png',
                  text: 'Tragedy',
                  color: CustomColors.secondaryColor,
                  containerSize: containerSize,
                  iconSize: iconSize,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenreContainer({
    required String icon,
    required String text,
    required Color color,
    required double containerSize,
    required double iconSize,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: iconSize,
                height: iconSize,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Color.fromARGB(255, 187, 187, 187).withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
