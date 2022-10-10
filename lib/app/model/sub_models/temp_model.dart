class Main {
  Main({
    this.temp,
    this.humidity,
    this.seaLevel,
    this.tempMin,
    this.tempMax,
  });

  double? temp;
  double? tempMin;
  double? tempMax;
  int? humidity;
  String? seaLevel;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
      temp: json["temp"],
      tempMin: json["temp_min"],
      tempMax: json["temp_max"],
      humidity: json["humidity"],
      seaLevel: json["sea_level"].toString());
}
