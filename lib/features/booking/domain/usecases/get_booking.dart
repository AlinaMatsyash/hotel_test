import 'package:dartz/dartz.dart';
import 'package:hotel_test/features/booking/data/models/booking_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/booking_repository.dart';

class GetBooking implements UseCase<BookingModel, NoParams> {
  final BookingRepository repository;

  GetBooking(this.repository);

  @override
  Future<Either<Failure, BookingModel>> call(NoParams params) async {
    return await repository.getBooking();
  }
}