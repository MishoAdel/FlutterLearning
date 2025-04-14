import 'package:store_app/helpers/api.dart';

class GetAllCategories {
  Future<List<dynamic>> getMyCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
