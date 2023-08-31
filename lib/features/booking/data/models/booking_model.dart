import 'package:hotel_test/features/booking/domain/entities/booking.dart';

class BookingModel extends Booking {
  BookingModel(
      {required int id,
      required String hotelName,
      required String hotelAdress,
      required int horating,
      required String ratingName,
      required String departure,
      required String arrivalCountry,
      required String tourDateStart,
      required String tourDateStop,
      required int numberOfNights,
      required String room,
      required String nutrition,
      required int tourPrice,
      required int fuelCharge,
      required int serviceCharge})
      : super(
          id: id,
          hotelName: hotelName,
          hotelAdress: hotelAdress,
          horating: horating,
          ratingName: ratingName,
          departure: departure,
          arrivalCountry: arrivalCountry,
          tourDateStart: tourDateStart,
          tourDateStop: tourDateStop,
          numberOfNights: numberOfNights,
          room: room,
          nutrition: nutrition,
          tourPrice: tourPrice,
          fuelCharge: fuelCharge,
          serviceCharge: serviceCharge,
        );

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      hotelName: json['hotel_name'],
      hotelAdress: json['hotel_adress'],
      horating: json['horating'],
      ratingName: json['rating_name'],
      departure: json['departure'],
      arrivalCountry: json['arrival_country'],
      tourDateStart: json['tour_date_start'],
      tourDateStop: json['tour_date_stop'],
      numberOfNights: json['number_of_nights'],
      room: json['room'],
      nutrition: json['nutrition'],
      tourPrice: json['tour_price'],
      fuelCharge: json['fuel_charge'],
      serviceCharge: json['service_charge'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotelName': hotelName,
      'hotelAdress': hotelAdress,
      'horating': horating,
      'ratingName': ratingName,
      'departure': departure,
      'arrivalCountry': arrivalCountry,
      'tourDateStart': tourDateStart,
      'tourDateStop': tourDateStop,
      'numberOfNights': numberOfNights,
      'room': room,
      'nutrition': nutrition,
      'tourPrice': tourPrice,
      'fuelCharge': fuelCharge,
      'serviceCharge': serviceCharge,
    };
  }
}
