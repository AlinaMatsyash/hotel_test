import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:hotel_test/features/booking/presentation/screens/booking_screen.dart';
import 'package:hotel_test/features/hotel/presentation/bloc/bloc.dart';
import 'package:hotel_test/features/room/presentation/bloc/bloc.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/router/router.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white.withOpacity(1),
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  double _durationValue = 400;
  late Duration _duration = Duration(milliseconds: _durationValue.round());

  Route generatePage(child) {
    return MaterialPageRoute(builder: (context) => child);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<BookingBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<HotelBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<RoomBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: ColorName.white,
          useMaterial3: true,
          scaffoldBackgroundColor: ColorName.white,
        ),
        builder: (_, router) {
          return router!;
        },
      ),
    );
  }
}
//
// mixin AppLocale {
//   static const String title = 'title';
//
//   static const Map<String, dynamic> EN = {title: 'Localization'};
//
// }
