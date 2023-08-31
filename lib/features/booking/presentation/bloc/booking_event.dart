import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBookingEvent extends BookingEvent {}
