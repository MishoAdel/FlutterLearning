import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryProducts {
  Future<List<ProductModel>> getMyProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> myProducts = [];

    for (int i = 0; i < data.length; i++) {
      myProducts.add(ProductModel.fromJson(data[i]));
    }
    return myProducts;
  }
}
