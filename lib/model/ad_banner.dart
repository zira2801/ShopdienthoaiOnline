import 'dart:convert';
import 'package:hive/hive.dart';
part 'ad_banner.g.dart';
List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
  json.decode(val)['data'].map((banner) => AdBanner.fromJson(banner))
);

@HiveType(typeId: 1)
class AdBanner{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;

  AdBanner({required this.id,required this.image});

  //Cú pháp truy xuất dữ liệu data['id'] và data['attributes']['image']... như trong đoạn code trên thường được sử dụng khi dữ liệu được trả về dưới dạng JSON.
factory AdBanner.fromJson(Map<String,dynamic> data) => AdBanner(id: data['id'], image: data['attributes']['image']['data']['attributes']['url']);
}