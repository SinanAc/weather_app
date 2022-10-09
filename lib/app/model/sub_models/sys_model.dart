class Sys {
    Sys({
        this.country,
        this.sunrise,
        this.sunset,
    });

    String? country;
    int? sunrise;
    int? sunset;

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );
}