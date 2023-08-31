import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/hotel_model.dart';

abstract class HotelRemoteDataSource {
  Future<HotelModel> getHotel();
}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {
  final http.Client client;

  HotelRemoteDataSourceImpl({required this.client});

  @override
  Future<HotelModel> getHotel() => _getHotelFromUrl(
      'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3');

  Future<HotelModel> _getHotelFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return HotelModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
