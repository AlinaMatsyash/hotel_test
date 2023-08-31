import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<BookingModel> getBooking();
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final http.Client client;

  BookingRemoteDataSourceImpl({required this.client});

  @override
  Future<BookingModel> getBooking() => _getBookingFromUrl(
      'https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8');

  Future<BookingModel> _getBookingFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return BookingModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
