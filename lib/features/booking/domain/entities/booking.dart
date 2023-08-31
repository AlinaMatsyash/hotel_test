import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  int id;
  String hotelName;
  String hotelAdress;
  int horating;
  String ratingName;
  String departure;
  String arrivalCountry;
  String tourDateStart;
  String tourDateStop;
  int numberOfNights;
  String room;
  String nutrition;
  int tourPrice;
  int fuelCharge;
  int serviceCharge;

  Booking({
    required this.id,
    required this.hotelName,
    required this.hotelAdress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  @override
  List<Object> get props => [
        id,
        hotelName,
        hotelAdress,
        horating,
        ratingName,
        departure,
        arrivalCountry,
        tourDateStart,
        tourDateStop,
        numberOfNights,
        room,
        nutrition,
        tourPrice,
        fuelCharge,
        serviceCharge,
      ];
}
