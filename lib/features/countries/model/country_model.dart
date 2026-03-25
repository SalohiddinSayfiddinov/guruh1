class Country {
  final int id;
  final String name;
  final String abbreviation;
  final String capital;
  final String currency;
  final String phone;
  final int population;
  final Media media;

  Country({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.capital,
    required this.currency,
    required this.phone,
    required this.population,
    required this.media,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] ?? -1,
      name: json['name'] ?? '',
      abbreviation: json['abbreviation'] ?? '',
      capital: json['capital'] ?? '',
      currency: json['currency'] ?? '',
      phone: json['phone'] ?? '',
      population: json['population'] ?? -1,
      media: Media.fromJson(json['media']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'abbreviation': abbreviation,
      'capital': capital,
      'currency': currency,
      'phone': phone,
      'population': population,
      'media': media.toJson(),
    };
  }
}

class Media {
  final String flag;
  final String emblem;
  final String orthographic;

  Media({required this.flag, required this.emblem, required this.orthographic});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      flag: json['flag'] ?? '',
      emblem: json['emblem'] ?? '',
      orthographic: json['orthographic'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'flag': flag, 'emblem': emblem, 'orthographic': orthographic};
  }
}
