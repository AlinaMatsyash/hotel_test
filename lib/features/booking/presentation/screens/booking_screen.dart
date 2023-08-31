import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_test/core/utils/convert_string_three_later.dart';
import 'package:hotel_test/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:hotel_test/features/booking/presentation/bloc/booking_event.dart';
import 'package:hotel_test/features/booking/presentation/bloc/booking_state.dart';
import 'package:hotel_test/features/booking/presentation/widgets/tourist_widget.dart';
import 'package:hotel_test/res/assets/assets.gen.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/router/router.dart';
import 'package:hotel_test/theme/app_typography.dart';
import 'package:hotel_test/widgets/button_app.dart';
import 'package:hotel_test/widgets/text_field_app.dart';

import '../widgets/loading_widget.dart';

@RoutePage()
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

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
            'Бронирование',
            style: AppTypography.proDisplayMedium18,
          )),
      backgroundColor: ColorName.greyLight1,
      body: SafeArea(
        child: BlocBuilder<BookingBloc, BookingState>(
          builder: (context, state) {
            double width = MediaQuery.of(context).size.width;
            double height = MediaQuery.of(context).size.height;
            if (state is EmptyState) {
              return const Text('Пусто');
            } else if (state is LoadingState) {
              return const LoadingWidget();
            } else if (state is LoadedState) {
              String foolPrise = convert((state.booking.tourPrice +
                      state.booking.fuelCharge +
                      state.booking.serviceCharge)
                  .toString());
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());
                  setState(() {});
                },
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ColorName.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorName.yellow.withOpacity(0.2)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Assets.icons.star.svg(),
                                        const SizedBox(width: 2),
                                        Text(
                                          '${state.booking.horating} ${state.booking.ratingName}',
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
                                  state.booking.hotelAdress,
                                  style:
                                      AppTypography.proDisplayMedium14.copyWith(
                                    color: ColorName.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ColorName.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Вылет из',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    SizedBox(
                                      width: width / 2 + 34,
                                      child: Text(
                                        state.booking.departure,
                                        style:
                                            AppTypography.proDisplayRegular16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Страна, город',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    SizedBox(
                                      width: width / 2 + 34,
                                      child: Text(
                                        state.booking.arrivalCountry,
                                        style:
                                            AppTypography.proDisplayRegular16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Даты',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    SizedBox(
                                      width: width / 2 + 34,
                                      child: Text(
                                        "${state.booking.tourDateStart} - ${state.booking.tourDateStop}",
                                        style:
                                            AppTypography.proDisplayRegular16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Кол-во ночей',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    SizedBox(
                                      width: width / 2 + 34,
                                      child: Text(
                                        "${state.booking.numberOfNights} ночей",
                                        style:
                                            AppTypography.proDisplayRegular16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Отель',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    SizedBox(
                                      width: width / 2 + 34,
                                      child: Text(
                                        "Steigenberger Makadi",
                                        style:
                                            AppTypography.proDisplayRegular16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Номер',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    SizedBox(
                                      width: width / 2 + 34,
                                      child: Text(
                                        state.booking.room,
                                        style:
                                            AppTypography.proDisplayRegular16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Питание',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    SizedBox(
                                      width: width / 2 + 34,
                                      child: Text(
                                        state.booking.nutrition,
                                        style:
                                            AppTypography.proDisplayRegular16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ColorName.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Информация о покупателе',
                                  style: AppTypography.proDisplayMedium22,
                                ),
                                const SizedBox(height: 20),
                                FieldApp(
                                  validator: (val) {
                                    if (!val!.isNotEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  controller: phoneController,
                                  labelText: 'Номер телефона',
                                  inputFormater: [
                                    MaskedInputFormatter('+7(###)###-##-##')
                                  ],
                                ),
                                const SizedBox(height: 8),
                                FieldApp(
                                  validator: (val) {
                                    if (!extString(val!).isValidEmail) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  labelText: 'Почта',
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                                  style: AppTypography.proDisplayRegular14
                                      .copyWith(
                                    color: ColorName.greyLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TouristWidget(
                          num: 0,
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: bodyElements,
                        ),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ColorName.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Добавить туриста',
                                  style: AppTypography.proDisplayMedium22,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (num < 9) {
                                      num++;
                                      setState(() {
                                        addBodyElement();
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorName.blue,
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Assets.icons.add.svg(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ColorName.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Тур',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    Text(
                                      '${convert(state.booking.tourPrice.toString())} ₽',
                                      style: AppTypography.proDisplayRegular16,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Топливный сбор',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    Text(
                                      '${convert(state.booking.fuelCharge.toString())} ₽',
                                      style: AppTypography.proDisplayRegular16,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Сервисный сбор',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    Text(
                                      '${convert(state.booking.serviceCharge.toString())} ₽',
                                      style: AppTypography.proDisplayRegular16,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'К оплате',
                                      style: AppTypography.proDisplayRegular16
                                          .copyWith(color: ColorName.greyLight),
                                    ),
                                    Text(
                                      '$foolPrise ₽',
                                      style: AppTypography.proDisplaySemiBold16
                                          .copyWith(color: ColorName.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: width,
                          child: ButtonApp(
                            text: 'Оплатить $foolPrise ₽',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.router.push(PaidForRoute());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ErrorState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<BookingBloc>(context).add(GetBookingEvent());
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

  List<Widget> bodyElements = [];
  int num = 0;

  void addBodyElement() {
    bodyElements.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TouristWidget(num: num),
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}
