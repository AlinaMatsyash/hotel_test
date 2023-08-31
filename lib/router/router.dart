import 'package:auto_route/auto_route.dart';
import 'package:hotel_test/features/booking/presentation/screens/booking_screen.dart';
import 'package:hotel_test/features/hotel/presentation/screens/hotel_screen.dart';
import 'package:hotel_test/features/paid_for/presentation/screens/paid_for.dart';
import 'package:hotel_test/features/room/presentation/screens/room_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HotelRoute.page, initial: true),
        AutoRoute(page: BookingRoute.page),
        AutoRoute(page: RoomRoute.page),
        AutoRoute(page: PaidForRoute.page),
      ];
}
