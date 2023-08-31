import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RoomEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetRoomEvent extends RoomEvent {}
