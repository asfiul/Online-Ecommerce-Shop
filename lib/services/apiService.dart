import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future getAllPosts() async {
    final allProductsUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductsUrl);
    //print(response.statusCode);
    //print(response.body);
    return json.decode(response.body);
  }

  Future getSingelPosts(int id) async {
    final allSingelUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(allSingelUrl);
    //print(response.statusCode);
    //print(response.body);
    return json.decode(response.body);
  }

  Future getAllcategories() async {
    final allCategoriesUrl =
        Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allCategoriesUrl);
    // print(response.statusCode);
    //print(response.body);
    return json.decode(response.body);
  }

  Future getCategorieslist(String catname) async {
    final categorieslistUrl =
        Uri.parse("https://fakestoreapi.com/products/category/$catname");
    final response = await http.get(categorieslistUrl);
    //print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

  Future getCart(int userid) async {
    final cartUrl = Uri.parse("https://fakestoreapi.com/carts/$userid");
    final response = await http.get(cartUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
