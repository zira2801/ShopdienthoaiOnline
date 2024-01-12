import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/const.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async{
    var response = await client.get(
        Uri.parse('$remoteUrl?populate=images,tags'));
    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=images,tags&filters[name][\$contains]=$keyword'));
    return response;
  }

  List<String> productNames = [];

  Future<dynamic> getProductNames() async {

    // Call API to get list of products
    var response = await client.get(Uri.parse('$remoteUrl?populate=images'));

    // Extract product data from response
    var products = jsonDecode(response.body)['data'];

    // Add name of each product to list
    for (var product in products) {
      productNames.add(product['attributes']['name']);
    }}

  Future<dynamic> getByCategory({required int id}) async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=images,tags&filters[category][id]=$id'));
    return response;
  }
}