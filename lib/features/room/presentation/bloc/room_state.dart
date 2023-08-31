import 'package:equatable/equatable.dart';
import 'package:hotel_test/features/room/domain/entities/room.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RoomState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends RoomState {}

class LoadingState extends RoomState {}

class LoadedState extends RoomState {
  final Room room;

  LoadedState({required this.room});

  @override
  List<Object> get props => [room];
}

class ErrorState extends RoomState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
