import 'dart:convert';

import 'package:storeapp/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    http.Response responce =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

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
