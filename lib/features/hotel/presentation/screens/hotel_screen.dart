import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/core/utils/convert_string_three_later.dart';
import 'package:hotel_test/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:hotel_test/features/hotel/presentation/bloc/hotel_event.dart';
import 'package:hotel_test/features/hotel/presentation/bloc/hotel_state.dart';
import 'package:hotel_test/widgets/indicators_image.dart';
import 'package:hotel_test/features/hotel/presentation/widgets/list_tile.dart';
import 'package:hotel_test/features/hotel/presentation/widgets/loading_widget.dart';
import 'package:hotel_test/res/assets/assets.gen.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/router/router.dart';
import 'package:hotel_test/theme/app_typography.dart';
import 'package:hotel_test/widgets/button_app.dart';

@RoutePage()
class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState() {
    BlocProvider.of<HotelBloc>(context).add(GetHotelEvent());
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          leading: null,
          title: Text(
        'Отель',
        style: AppTypography.proDisplayMedium18,
      )),
      backgroundColor: ColorName.greyLight1,
      body: SafeArea(
        child: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            double width = MediaQuery.of(context).size.width;
            double height = MediaQuery.of(context).size.height;
            if (state is EmptyState) {
              return const Text('Пусто');
            } else if (state is LoadingState) {
              return const LoadingWidget();
            } else if (state is LoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HotelBloc>(context).add(GetHotelEvent());
                  setState(() {});
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0))),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                SizedBox(
                                  height: 257,
                                  width: width,
                                  child: PageView.builder(
                                      itemCount: state.hotel.imageUrls.length,
                                      pageSnapping: true,
                                      controller: _pageController,
                                      onPageChanged: (page) {
                                        setState(() {
                                          activePage = page;
                                        });
                                      },
                                      itemBuilder: (context, pagePosition) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: SizedBox(
                                            height: 257,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.network(
                                                state.hotel
                                                    .imageUrls[pagePosition],
                                                fit: BoxFit.fitHeight,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: indicators(
                                          state.hotel.imageUrls.length,
                                          activePage,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            ColorName.yellow.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Assets.icons.star.svg(),
                                            const SizedBox(width: 2),
                                            Text(
                                              '${state.hotel.rating} ${state.hotel.ratingName}',
                                              style: AppTypography
                                                  .proDisplayMedium16
                                                  .copyWith(
                                                      color: ColorName.yellow),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Steigenberger Makadi',
                                      style: AppTypography.proDisplayMedium22,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      state.hotel.adress,
                                      style: AppTypography.proDisplayMedium14
                                          .copyWith(color: ColorName.blue),
                                    ),
                                    const SizedBox(height: 16),
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            'от ${convert(state.hotel.minimalPrice.toString())} ₽',
                                        style: AppTypography
                                            .proDisplaySemiBold30
                                            .copyWith(color: ColorName.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '  за тур с перелётом',
                                              style: AppTypography
                                                  .proDisplayRegular16
                                                  .copyWith(
                                                      color:
                                                          ColorName.greyLight)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Об отеле',
                                style: AppTypography.proDisplayMedium22,
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                children: List.generate(
                                  state
                                      .hotel.aboutTheHotel.peculiarities.length,
                                  (i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: ColorName.greyLight2),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Text(
                                            state.hotel.aboutTheHotel
                                                .peculiarities[i],
                                            style: AppTypography
                                                .proDisplayMedium16
                                                .copyWith(
                                                    color: ColorName.greyLight),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.hotel.aboutTheHotel.description,
                                style: AppTypography.proDisplayRegular16
                                    .copyWith(
                                        color:
                                            ColorName.black.withOpacity(0.9)),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: ColorName.greyLight2),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      ListTileWidget(
                                        icon: Assets.icons.emojiHappy.svg(),
                                        title: 'Удобства',
                                        subtitle: 'Самое необходимое',
                                        onTap: () {},
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 35),
                                        child: Divider(
                                          height: 1,
                                          color: ColorName.greyLight
                                              .withOpacity(0.15),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      ListTileWidget(
                                        icon: Assets.icons.tickQuare.svg(),
                                        title: 'Что включено',
                                        subtitle: 'Самое необходимое',
                                        onTap: () {},
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 35),
                                        child: Divider(
                                          height: 1,
                                          color: ColorName.greyLight
                                              .withOpacity(0.15),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      ListTileWidget(
                                        icon: Assets.icons.closeSquare.svg(),
                                        title: 'Что не включено',
                                        subtitle: 'Самое необходимое',
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ButtonApp(
                        text: 'К выбору номера',
                        onTap: () {
                          context.router.push(RoomRoute());
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ErrorState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HotelBloc>(context).add(GetHotelEvent());
                  setState(() {});
                },
                child: SizedBox(
                  height: height - 200,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height / 2 - 100),
                        child: Center(
                          child: Text(
                            state.message,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
