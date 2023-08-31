import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/hotel/data/models/hotel_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/hotel_repository.dart';
import '../datasources/hotel_remote_data_source.dart';


class HotelRepositoryImpl implements HotelRepository {
  final HotelRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HotelRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, HotelModel>> getHotel() async {
    return await _getHotel(() {
      return remoteDataSource.getHotel();
    });
  }

  Future<Either<Failure, HotelModel>> _getHotel(
    get,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHotel = await get();
        return Right(remoteHotel);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
        return Left(ServerFailure());
    }
  }
}
