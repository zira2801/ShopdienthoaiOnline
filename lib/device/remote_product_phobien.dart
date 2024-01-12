import 'package:http/http.dart' as http;
import 'package:shop/const.dart';

class RemoteProductPhobien{
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/product-pho-biens';
  
  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=product.images&populate=product.tags'));
    return response;
  }
}