class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String imageUrl;
  final RatingModel? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.imageUrl,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      imageUrl: jsonData['image'],
      rating: jsonData['rating'] == null
          ? null
          : RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final num rate;
  final num count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
