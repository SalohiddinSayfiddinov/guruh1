class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String image;
  final String description;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.description,
    this.isFavorite = false,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      category: map['category'],
      image: map['image'],
      description: map['description'],
    );
  }
}
