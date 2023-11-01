import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

List<Widget> getStars({required double? rating, required double starSize}) {
  List<Icon> temp = [];
  if (rating != null) {
    for (var i = 0; i < rating ~/ 2; i++) {
      //(rating/2).toInt() == rating ~/ 2
      temp.add(Icon(
        FeatherIcons.star,
        size: starSize,
      ));
    }
    if (rating > 0 && rating % 2 != 0)
      temp.add(Icon(
        FeatherIcons.heart,
        size: starSize,
      ));
    while (temp.length < 5) {
      temp.add(Icon(
        FeatherIcons.airplay,
        size: starSize,
      ));
    }
  }
  return temp;
}
