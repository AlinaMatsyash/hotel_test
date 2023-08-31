import 'package:hotel_test/features/hotel/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required int id,
    required String name,
    required String adress,
    required int minimalPrice,
    required String priceForIt,
    required int rating,
    required String ratingName,
    required List<String> imageUrls,
    required AboutTheHotel aboutTheHotel,
  }) : super(
          id: id,
          name: name,
          adress: adress,
          minimalPrice: minimalPrice,
          priceForIt: priceForIt,
          rating: rating,
          ratingName: ratingName,
          imageUrls: imageUrls,
          aboutTheHotel: aboutTheHotel,
        );

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      adress: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: json['image_urls'].cast<String>(),
      aboutTheHotel: AboutTheHotel.fromJson(json['about_the_hotel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adress': adress,
      'minimalPrice': minimalPrice,
      'priceForIt': priceForIt,
      'rating': rating,
      'ratingName': ratingName,
      'imageUrls': imageUrls,
      'aboutTheHotel': aboutTheHotel
    };
  }
}

class AboutTheHotel {
  String description;
  List<String> peculiarities;

  AboutTheHotel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) {
    return AboutTheHotel(
      description: json['description'],
      peculiarities: json['peculiarities'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'peculiarities': peculiarities,
    };
  }
}
