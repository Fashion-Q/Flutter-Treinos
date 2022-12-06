class Modelo {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercent;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String smartphones;
  final String thumbnail;
  final List<dynamic> images;

  Modelo(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercent,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.smartphones,
      required this.thumbnail,
      required this.images});

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "description" : description,
    "price" : price,
    "discountPercent" : discountPercent,
    "rating" : rating,
    "stock" : stock,
    "brand" : brand,
    "category" : category,
    "smartphones" : smartphones,
    "thumbnail" : thumbnail,
    "images" : images
  };
// final int id;
//   final String title;
//   final String description;
//   final double price;
//   final double discountPercent;
//   final double rating;
//   final int stock;
//   final String brand;
//   final String category;
//   final String smartphones;
//   final String thumbnail;
//   final List<dynamic> images;

}
