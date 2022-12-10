class Modelo {
 int? id;
 String? title;
 String? description;
 double? price;
 double? discountPercentage;
 double? rating;
 int? stock;
 String? brand;
 String? category;
 String? thumbnail;
 List<dynamic>? images;

  Modelo(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  Modelo.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "Sem info";
    description = json['description'] ?? "Sem info";
    price = json['price'] ?? 0.0;
    discountPercentage = json['discountPercentage'] ?? "Sem info";
    rating = json['rating'] ?? 0.0;
    stock = json['stock'] ?? 0.0;
    brand = json['brand'] ?? "Sem info";
    category = json['category'] ?? "Sem info";
    thumbnail = json['thumbnail'] ?? "Sem info";
    images = json['images'] ?? ["Sem info"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": images
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
