
import 'dart:convert';

List<Product> ProductPhoBienListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((product) => Product.popularProductFromJson(product))
);
class Product{
  final int id;
  final String name;
  final String mota;
  final List<String> images;

  Product({required this.id, required this.name,required this.mota,required this.images});

  factory Product.popularProductFromJson(Map<String,dynamic> data) =>
      Product(id: data['id'],
          name: data['attributes']['product']['data']['attributes']['name'],
          mota: data['attributes']['product']['data']['attributes']['mota'],
          images: List<String>.from(data['attributes']['product']['data']['attributes']['images']['data'].map((image) =>
          image['attributes']['url'])));
}
