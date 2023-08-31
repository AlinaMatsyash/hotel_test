import 'package:hotel_test/features/room/domain/entities/room.dart';

class RoomModel extends Room {
  RoomModel({
    required List<Rooms> rooms,
  }) : super(rooms: rooms);

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      rooms:
          (json['rooms'] as List).map((item) => Rooms.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rooms': rooms,
    };
  }
}

class Rooms {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  Rooms({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) {
    return Rooms(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      pricePer: json['price_per'],
      peculiarities: json['peculiarities'].cast<String>(),
      imageUrls: json['image_urls'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'pricePer': pricePer,
      'peculiarities': peculiarities,
      'imageUrls': imageUrls,
    };
  }
}
