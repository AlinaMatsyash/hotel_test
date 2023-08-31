import 'package:bloc/bloc.dart';
import 'package:hotel_test/core/error/failures.dart';
import 'package:hotel_test/core/usecases/usecase.dart';

import './bloc.dart';
import '../../domain/usecases/get_booking.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetBooking getBooking;

  BookingBloc({
    required GetBooking booking,
  })  : getBooking = booking,
        super(EmptyState()) {
    on<BookingEvent>((event, emit) async {
      if (event is GetBookingEvent) {
        emit(LoadingState());
        final failureOrBooking = await getBooking(NoParams());
        failureOrBooking.fold(
            (failure) =>
                emit(ErrorState(message: _mapFailureToMessage(failure))),
            (booking) => emit(LoadedState(booking: booking)));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected error';
    }
  }
}
