import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/hotel/data/models/hotel_model.dart';

import '../../../../core/error/failures.dart';

abstract class HotelRepository {
  Future<Either<Failure, HotelModel>> getHotel();
}
