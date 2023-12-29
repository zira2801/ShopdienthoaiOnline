
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:shop/model/tag.dart';
part 'product.g.dart';
List<Product> ProductPhoBienListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((product) => Product.popularProductFromJson(product))
);

List<Product> ProductListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((products) => Product.ProductFromJson(products))
);
@HiveType(typeId: 3)
class Product{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String mota;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
 final List<Tag> tags;

  Product({required this.id, required this.name,required this.mota,required this.images,required this.tags});

  factory Product.popularProductFromJson(Map<String,dynamic> data) =>
      Product(id: data['id'],
          name: data['attributes']['product']['data']['attributes']['name'],
          mota: data['attributes']['product']['data']['attributes']['mota'],
          images: List<String>.from(data['attributes']['product']['data']['attributes']['images']['data'].map((image) =>
          image['attributes']['url'])),
      tags: []);

  factory Product.ProductFromJson(Map<String,dynamic> data) =>
      Product(id: data['id'],
          name: data['attributes']['name'],
          mota: data['attributes']['mota'],
          images: List<String>.from(data['attributes']['images']['data'].map((image) =>
          image['attributes']['url'])),
          tags: List<Tag>.from(data['attributes']['tags']['data'].map((val) => Tag.fromJson(val))));
}
