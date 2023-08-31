import 'package:equatable/equatable.dart';
import 'package:hotel_test/features/room/data/models/room_model.dart';

class Room extends Equatable {
  List<Rooms> rooms;

  Room({required this.rooms});

  @override
  List<Object> get props => [rooms];
}
