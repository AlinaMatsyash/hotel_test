import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/booking/data/models/booking_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_data_source.dart';


class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookingRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BookingModel>> getBooking() async {
    return await _getBooking(() {
      return remoteDataSource.getBooking();
    });
  }

  Future<Either<Failure, BookingModel>> _getBooking(
    get,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBooking = await get();
        return Right(remoteBooking);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
        return Left(ServerFailure());
    }
  }
}
