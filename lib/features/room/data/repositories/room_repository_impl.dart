import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/room/data/datasources/room_remote_data_source.dart';
import 'package:hotel_test/features/room/data/models/room_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/room_repository.dart';


class RoomRepositoryImpl implements RoomRepository {
  final RoomRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RoomRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RoomModel>> getRoom() async {
    return await _getRoom(() {
      return remoteDataSource.getRoom();
    });
  }

  Future<Either<Failure, RoomModel>> _getRoom(
    get,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRoom = await get();
        return Right(remoteRoom);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
        return Left(ServerFailure());
    }
  }
}
