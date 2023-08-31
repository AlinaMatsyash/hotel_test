import 'package:flutter/material.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 7,
      height: 7,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? ColorName.black
              : ColorName.black.withOpacity(0.22),
          shape: BoxShape.circle),
    );
  });
}
