import 'package:bloc/bloc.dart';
import 'package:hotel_test/core/error/failures.dart';
import 'package:hotel_test/core/usecases/usecase.dart';

import './bloc.dart';
import '../../domain/usecases/get_room.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final GetRoom getRoom;

  RoomBloc({
    required GetRoom room,
  })  : getRoom = room,
        super(EmptyState()) {
    on<RoomEvent>((event, emit) async {
      if (event is GetRoomEvent) {
        emit(LoadingState());
        final failureOrRoom = await getRoom(NoParams());
        failureOrRoom.fold(
            (failure) =>
                emit(ErrorState(message: _mapFailureToMessage(failure))),
            (room) => emit(LoadedState(room: room)));
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
