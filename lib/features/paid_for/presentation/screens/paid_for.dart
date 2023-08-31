import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_test/res/assets/assets.gen.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/router/router.dart';
import 'package:hotel_test/theme/app_typography.dart';
import 'package:hotel_test/widgets/button_app.dart';

@RoutePage()
class PaidForScreen extends StatelessWidget {
  const PaidForScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                context.router.pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.arrowLeft.svg(),
              )),
          title: Text(
            'Заказ оплачен',
            style: AppTypography.proDisplayMedium18,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 8),
              child: Column(
                children: [
                  Assets.images.complete.image(),
                  const SizedBox(height: 32),
                  Text(
                    'Ваш заказ принят в работу',
                    style: AppTypography.proDisplayMedium22,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Text(
                      'Подтверждение заказа №${random(1, 999999)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                      style: AppTypography.proDisplayRegular16
                          .copyWith(color: ColorName.greyLight),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(
                  height: 1,
                  color: ColorName.stroke,
                ),
                const SizedBox(height: 12),
                ButtonApp(
                  text: 'Супер!',
                  onTap: () {
                    context.router.replaceAll([const HotelRoute()]);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
int random(int min, int max) {
  return min + Random().nextInt(max - min);
}