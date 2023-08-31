import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/booking/data/models/booking_model.dart';

import '../../../../core/error/failures.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookingModel>> getBooking();
}
