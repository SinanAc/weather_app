class Wind {
    Wind({
        this.speed,
    });

    double? speed;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]
    );

}