import 'package:http/http.dart' as http;
import 'dart:convert';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    http.Response responce = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (responce.statusCode == 200) {
      List<dynamic> data = jsonDecode(responce.body);

      return data;
    } else {
      throw Exception(
          'There is a problem with states code ${responce.statusCode}');
    }
  }
}
