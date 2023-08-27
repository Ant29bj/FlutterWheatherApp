import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/app/models/wehather.dart';

class WheatherRepository {
  static const String _apiKey =
      '2dcf8b8ea5msha304fc3b7fcd52fp111e17jsn2cf8ace7ec1a';
  var apiUrl = 'https://weatherapi-com.p.rapidapi.com/current.json?q=';

  final _apiHeaders = {
    'X-RapidAPI-Key': _apiKey,
    'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
  };

  Future<Wheather> getWheather(String coordinates) async {
    final response =
        await http.get(Uri.parse(apiUrl + coordinates), headers: _apiHeaders);

    if (response.statusCode == 200) {
      return Wheather.fromJson(json.decode(response.body));
    } else {
      throw Exception('fail');
    }
  }
}
