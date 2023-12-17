import 'dart:convert';

List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
  json.decode(val)['data'].map((banner) => AdBanner.fromJson(banner))
);
class AdBanner{
  final int id;
  final String image;

  AdBanner({required this.id,required this.image});

  //Cú pháp truy xuất dữ liệu data['id'] và data['attributes']['image']... như trong đoạn code trên thường được sử dụng khi dữ liệu được trả về dưới dạng JSON.
factory AdBanner.fromJson(Map<String,dynamic> data) => AdBanner(id: data['id'], image: data['attributes']['image']['data']['attributes']['url']);
}