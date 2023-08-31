import 'package:flutter/material.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/theme/app_typography.dart';

class ButtonApp extends StatelessWidget {
  String text;
  Function() onTap;

  ButtonApp({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: ColorName.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: ColorName.blue),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    text,
                    style: AppTypography.proDisplayMedium16.copyWith(
                      color: ColorName.white,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
