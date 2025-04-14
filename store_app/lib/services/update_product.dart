import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String describtion,
      required String image,
      required int id,
      required String category}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': describtion,
        'image': image,
        'category': category,
      },
    );

    return ProductModel.fromJson(data);
  }
}
