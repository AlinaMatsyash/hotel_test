// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingScreen(),
      );
    },
    HotelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HotelScreen(),
      );
    },
    PaidForRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaidForScreen(),
      );
    },
    RoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RoomScreen(),
      );
    },
  };
}

/// generated route for
/// [BookingScreen]
class BookingRoute extends PageRouteInfo<void> {
  const BookingRoute({List<PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HotelScreen]
class HotelRoute extends PageRouteInfo<void> {
  const HotelRoute({List<PageRouteInfo>? children})
      : super(
          HotelRoute.name,
          initialChildren: children,
        );

  static const String name = 'HotelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaidForScreen]
class PaidForRoute extends PageRouteInfo<void> {
  const PaidForRoute({List<PageRouteInfo>? children})
      : super(
          PaidForRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaidForRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoomScreen]
class RoomRoute extends PageRouteInfo<void> {
  const RoomRoute({List<PageRouteInfo>? children})
      : super(
          RoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
