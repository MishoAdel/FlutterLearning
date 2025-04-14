import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String describtion,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
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
