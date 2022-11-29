class WeatherElement {
  WeatherElement({
    this.main,
    this.description,
    this.icon,
  });

  String? main;
  String? description;
  String? icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        main: json["main"],
        description: json["description"] ?? 'No data',
        icon: json["icon"],
      );
}
