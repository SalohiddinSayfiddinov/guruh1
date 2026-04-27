class Post {
  final String id;
  final String name;
  final String lastname;
  final String city;
  final String image;

  const Post({
    required this.id,
    required this.name,
    required this.lastname,
    required this.city,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      city: json['city'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "lastname": lastname, "city": city, "image": image};
  }
}
