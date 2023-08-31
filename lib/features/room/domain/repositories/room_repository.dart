import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/room/data/models/room_model.dart';

import '../../../../core/error/failures.dart';

abstract class RoomRepository {
  Future<Either<Failure, RoomModel>> getRoom();
}
