class Clouds {
    Clouds({
        this.all,
    });

    String? all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"].toString(),
    );
}