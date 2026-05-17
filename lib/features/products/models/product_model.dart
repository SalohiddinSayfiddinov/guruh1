class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final double oldPrice;
  final bool isFreeShipping;
  final String gender;
  final List<String> colors;
  final List<String> sizes;
  final List<String> images;
  final List<ReviewModel> reviews;
  final int categoryId;
  final bool isWishlisted;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.isFreeShipping,
    required this.gender,
    required this.colors,
    required this.sizes,
    required this.images,
    required this.reviews,
    required this.categoryId,
    required this.isWishlisted,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      oldPrice: (json['old_price'] ?? 0).toDouble(),
      isFreeShipping: json['is_free_shipping'] ?? false,
      gender: json['gender'] ?? '',
      colors: List<String>.from(json['colors'] ?? []),
      sizes: List<String>.from(json['sizes'] ?? []),
      images: List<String>.from(json['images'] ?? []),
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      categoryId: json['category_id'] ?? 0,
      isWishlisted: json['is_wishlisted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'old_price': oldPrice,
      'is_free_shipping': isFreeShipping,
      'gender': gender,
      'colors': colors,
      'sizes': sizes,
      'images': images,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'category_id': categoryId,
      'is_wishlisted': isWishlisted,
    };
  }
}

class ReviewModel {
  final String userName;
  final String userImage;
  final int stars;
  final String comment;
  final String date;

  ReviewModel({
    required this.userName,
    required this.userImage,
    required this.stars,
    required this.comment,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['user_name'] ?? '',
      userImage: json['user_image'] ?? '',
      stars: json['stars'] ?? 0,
      comment: json['comment'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'user_image': userImage,
      'stars': stars,
      'comment': comment,
      'date': date,
    };
  }
}
