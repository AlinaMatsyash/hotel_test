import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/features/room/presentation/bloc/bloc.dart';
import 'package:hotel_test/features/room/presentation/widgets/room_card.dart';
import 'package:hotel_test/res/assets/assets.gen.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/router/router.dart';
import 'package:hotel_test/theme/app_typography.dart';

import '../widgets/loading_widget.dart';

@RoutePage()
class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  void initState() {
    BlocProvider.of<RoomBloc>(context).add(GetRoomEvent());
    super.initState();
  }

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
            ),
          ),
          title: Text(
            'Steigenberger Makadi',
            style: AppTypography.proDisplayMedium18,
          )),
      backgroundColor: ColorName.greyLight1,
      body: SafeArea(
        child: BlocBuilder<RoomBloc, RoomState>(
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
                  BlocProvider.of<RoomBloc>(context).add(GetRoomEvent());
                  setState(() {});
                },
                child: ListView.builder(
                  itemCount: state.room.rooms.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: RoomCard(
                        rooms: state.room.rooms[index],
                        onTap: () {
                          context.router.push(BookingRoute());
                        },
                      ),
                    );
                  },
                ),
              );
            } else if (state is ErrorState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<RoomBloc>(context).add(GetRoomEvent());
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
