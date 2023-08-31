import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/room_model.dart';

abstract class RoomRemoteDataSource {
  Future<RoomModel> getRoom();
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final http.Client client;

  RoomRemoteDataSourceImpl({required this.client});

  @override
  Future<RoomModel> getRoom() =>
      _getRoomFromUrl('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd');

  Future<RoomModel> _getRoomFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return RoomModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
