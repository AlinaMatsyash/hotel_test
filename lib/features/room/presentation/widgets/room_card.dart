import 'package:flutter/material.dart';
import 'package:hotel_test/core/utils/convert_string_three_later.dart';
import 'package:hotel_test/features/room/data/models/room_model.dart';
import 'package:hotel_test/res/assets/assets.gen.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/theme/app_typography.dart';
import 'package:hotel_test/widgets/button_app.dart';
import 'package:hotel_test/widgets/indicators_image.dart';

class RoomCard extends StatefulWidget {
  Rooms rooms;
  Function() onTap;

  RoomCard({required this.rooms, required this.onTap, super.key});

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorName.white, borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 257,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: widget.rooms.imageUrls.length,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        activePage = page;
                      });
                    },
                    itemBuilder: (context, pagePosition) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 257,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              widget.rooms.imageUrls[pagePosition],
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, exception, stackTrace) {
                                return Center(
                                    child: Text(
                                  'Error widget...',
                                  style: AppTypography.proDisplaySemiBold30,
                                ));
                              },
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorName.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(
                        widget.rooms.imageUrls.length,
                        activePage,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.rooms.name,
                    style: AppTypography.proDisplayMedium22,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: List.generate(
                      widget.rooms.peculiarities.length,
                      (i) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: ColorName.greyLight2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                widget.rooms.peculiarities[i],
                                style: AppTypography.proDisplayMedium16
                                    .copyWith(color: ColorName.greyLight),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: ColorName.blue.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            'Подробнее о номере',
                            style: AppTypography.proDisplayMedium16
                                .copyWith(color: ColorName.blue),
                          ),
                          const SizedBox(width: 2),
                          Assets.icons.arrowRight.svg(color: ColorName.blue)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 21),
                  RichText(
                    text: TextSpan(
                      text: '${convert(widget.rooms.price.toString())} ₽',
                      style: AppTypography.proDisplaySemiBold30
                          .copyWith(color: ColorName.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '  ${widget.rooms.pricePer.toLowerCase()}',
                            style: AppTypography.proDisplayRegular16
                                .copyWith(color: ColorName.greyLight)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ButtonApp(
                    text: 'Выбрать номер',
                    onTap: widget.onTap,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
