import 'package:equatable/equatable.dart';
import 'package:hotel_test/features/hotel/data/models/hotel_model.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final AboutTheHotel aboutTheHotel;

  const Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        adress,
        minimalPrice,
        priceForIt,
        rating,
        ratingName,
        imageUrls,
        aboutTheHotel,
      ];
}
