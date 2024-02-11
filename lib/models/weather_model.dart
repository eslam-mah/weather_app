class WeatherModel {
  String name;
  dynamic temp;
  DateTime time;
  String weatherStateName;
  WeatherModel(
      {required this.name,
      required this.temp,
      required this.time,
      required this.weatherStateName});

  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
        name: jsonData["location"]["name"],
        temp: jsonData["current"]["temp_c"],
        time: DateTime.parse(jsonData["current"]["last_updated"]),
        weatherStateName: jsonData["current"]["condition"]["text"]);
  }
}
