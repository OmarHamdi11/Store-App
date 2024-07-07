import 'package:storeapp/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(String categoryName) async {
    http.Response responce = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));

    if (responce.statusCode == 200) {
      List<dynamic> data = jsonDecode(responce.body);

      List<ProductModel> productsList = [];
      for (var i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return productsList;
    } else {
      throw Exception(
          'There is a problem with states code ${responce.statusCode}');
    }
  }
}
