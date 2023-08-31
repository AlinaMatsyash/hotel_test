import 'package:get_it/get_it.dart';
import 'package:hotel_test/features/booking/data/datasources/booking_remote_data_source.dart';
import 'package:hotel_test/features/booking/data/repositories/booking_repository_impl.dart';
import 'package:hotel_test/features/booking/domain/usecases/get_booking.dart';
import 'package:hotel_test/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:hotel_test/features/hotel/data/datasources/hotel_remote_data_source.dart';
import 'package:hotel_test/features/hotel/data/repositories/hotel_repository_impl.dart';
import 'package:hotel_test/features/hotel/domain/repositories/hotel_repository.dart';
import 'package:hotel_test/features/hotel/domain/usecases/get_hotel.dart';
import 'package:hotel_test/features/hotel/presentation/bloc/bloc.dart';
import 'package:hotel_test/features/room/data/datasources/room_remote_data_source.dart';
import 'package:hotel_test/features/room/data/repositories/room_repository_impl.dart';
import 'package:hotel_test/features/room/domain/repositories/room_repository.dart';
import 'package:hotel_test/features/room/domain/usecases/get_room.dart';
import 'package:hotel_test/features/room/presentation/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'features/booking/domain/repositories/booking_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => BookingBloc(
      booking: sl(),
    ),
  );
  sl.registerFactory(
    () => HotelBloc(
      hotel: sl(),
    ),
  );
  sl.registerFactory(
    () => RoomBloc(
      room: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetBooking(sl()));
  sl.registerLazySingleton(() => GetHotel(sl()));
  sl.registerLazySingleton(() => GetRoom(sl()));

  sl.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<HotelRepository>(
    () => HotelRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<RoomRepository>(
    () => RoomRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<HotelRemoteDataSource>(
    () => HotelRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<RoomRemoteDataSource>(
    () => RoomRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
