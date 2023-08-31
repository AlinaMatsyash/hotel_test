import 'package:bloc/bloc.dart';
import 'package:hotel_test/core/error/failures.dart';
import 'package:hotel_test/core/usecases/usecase.dart';
import 'package:hotel_test/features/hotel/domain/usecases/get_hotel.dart';

import './bloc.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final GetHotel getHotel;

  HotelBloc({
    required GetHotel hotel,
  })  : getHotel = hotel,
        super(EmptyState()) {
    on<HotelEvent>((event, emit) async {
      if (event is GetHotelEvent) {
        emit(LoadingState());
        final failureOrHotel = await getHotel(NoParams());
        failureOrHotel.fold(
            (failure) =>
                emit(ErrorState(message: _mapFailureToMessage(failure))),
            (hotel) => emit(LoadedState(hotel: hotel)));
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
