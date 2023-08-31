import 'package:equatable/equatable.dart';
import 'package:hotel_test/features/hotel/domain/entities/hotel.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HotelState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends HotelState {}

class LoadingState extends HotelState {}

class LoadedState extends HotelState {
  final Hotel hotel;

  LoadedState({required this.hotel});

  @override
  List<Object> get props => [hotel];
}

class ErrorState extends HotelState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
