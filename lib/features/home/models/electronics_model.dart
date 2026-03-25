class ElectronicsModel {
  final String id;
  final String name;
  final String image;
  final String type;
  final int price;

  ElectronicsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.price,
  });

  factory ElectronicsModel.fromJson(Map<String, dynamic> json) {
    return ElectronicsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      type: json['type'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image, 'type': type, 'price': price};
  }
}
