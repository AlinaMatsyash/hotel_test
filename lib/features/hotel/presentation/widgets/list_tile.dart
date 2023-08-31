import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_test/res/assets/assets.gen.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/theme/app_typography.dart';

class ListTileWidget extends StatelessWidget {
  SvgPicture icon;
  Function() onTap;
  String title;
  String subtitle;

  ListTileWidget(
      {required this.icon,
      required this.onTap,
      required this.title,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.proDisplayMedium16
                      .copyWith(color: ColorName.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTypography.proDisplayMedium14
                      .copyWith(color: ColorName.greyLight),
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Assets.icons.arrowRight.svg(),
        )
      ],
    );
  }
}
