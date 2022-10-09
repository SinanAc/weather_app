class Main {
    Main({
        this.temp,
        this.humidity,
        this.seaLevel,
    });

    double? temp;
    int? humidity;
    String? seaLevel;

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"],
        humidity: json["humidity"],
        seaLevel: json["sea_level"].toString()
    );
}