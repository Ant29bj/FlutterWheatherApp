import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Wheather {
  Wheather() {
    locationName = '';
    region = '';
    lastUpdate = '';
    tempC = 0.0;
    tempF = 0.0;
    condition = '';
  }
  Wheather.fromJson(Map<String, dynamic> json) {
    locationName = json['location']['name'];
    region = json['location']['region'];
    lastUpdate = json['current']['last_updated'];
    tempC = json['current']['temp_c'];
    tempF = json['current']['temp_f'];
    condition = json['current']['condition']['text'];
    icon = icons[json['current']['condition']['code']] ?? Icons.not_interested;
  }

  late String locationName;
  late String region;
  late String lastUpdate;
  late double tempC;
  late double tempF;
  late String condition;
  late IconData icon;

  static const icons = {
    1000: WeatherIcons.sunset,
    1003: WeatherIcons.cloudy,
    1006: WeatherIcons.cloudy,
    1009: WeatherIcons.cloudy,
    // 1030: WeatherIcons.mist,
    1063: WeatherIcons.rain,
    1066: WeatherIcons.snow,
    1069: WeatherIcons.sleet,
    // 1072: WeatherIcons.freezing_drizzle,
    1087: WeatherIcons.thunderstorm,
    1114: WeatherIcons.snow_wind,
    1117: WeatherIcons.snow_wind,
    1135: WeatherIcons.fog,
    // 1147: WeatherIcons.freezing_fog,
    // 1150: WeatherIcons.drizzle,
    // 1153: WeatherIcons.drizzle,
    // 1168: WeatherIcons.freezing_rain,
    // 1171: WeatherIcons.freezing_rain,
    1180: WeatherIcons.showers,
    1183: WeatherIcons.showers,
    1186: WeatherIcons.showers,
    1189: WeatherIcons.showers,
    1192: WeatherIcons.showers,
    1195: WeatherIcons.showers,
    // 1198: WeatherIcons.freezing_rain,
    // 1201: WeatherIcons.freezing_rain,
    1204: WeatherIcons.sleet,
    1207: WeatherIcons.sleet,
    1210: WeatherIcons.snow,
    1213: WeatherIcons.snow,
    1216: WeatherIcons.snow,
    1219: WeatherIcons.snow,
    1222: WeatherIcons.snow,
    1225: WeatherIcons.snow,
    1237: WeatherIcons.sleet,
    1240: WeatherIcons.showers,
    1243: WeatherIcons.showers,
    1246: WeatherIcons.showers,
    1249: WeatherIcons.sleet,
    1252: WeatherIcons.sleet,
    1255: WeatherIcons.snow,
    1258: WeatherIcons.snow,
    1261: WeatherIcons.sleet,
    1264: WeatherIcons.sleet,
    1273: WeatherIcons.thunderstorm,
    1276: WeatherIcons.thunderstorm,
    1279: WeatherIcons.thunderstorm,
    1282: WeatherIcons.thunderstorm,
  };
}
