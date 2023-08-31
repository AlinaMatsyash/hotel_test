import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/hotel/data/models/hotel_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/hotel_repository.dart';

class GetHotel implements UseCase<HotelModel, NoParams> {
  final HotelRepository repository;

  GetHotel(this.repository);

  @override
  Future<Either<Failure, HotelModel>> call(NoParams params) async {
    return await repository.getHotel();
  }
}