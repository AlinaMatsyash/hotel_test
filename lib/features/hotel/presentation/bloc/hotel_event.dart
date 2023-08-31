import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HotelEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHotelEvent extends HotelEvent {}
