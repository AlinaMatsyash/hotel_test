import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/room/data/models/room_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/room_repository.dart';

class GetRoom implements UseCase<RoomModel, NoParams> {
  final RoomRepository repository;

  GetRoom(this.repository);

  @override
  Future<Either<Failure, RoomModel>> call(NoParams params) async {
    return await repository.getRoom();
  }
}