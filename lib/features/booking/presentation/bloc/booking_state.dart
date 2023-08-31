import 'package:equatable/equatable.dart';
import 'package:hotel_test/features/booking/domain/entities/booking.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends BookingState {}

class LoadingState extends BookingState {}

class LoadedState extends BookingState {
  final Booking booking;

  LoadedState({required this.booking});

  @override
  List<Object> get props => [booking];
}

class ErrorState extends BookingState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
