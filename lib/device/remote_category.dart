import 'package:http/http.dart' as http;
import 'package:shop/const.dart';
class RemoteCategory {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/category-pho-biens';

  Future<dynamic> get() async{
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=category.image&pagination[start]=0&pagination[limit]=10'));
    return response;
  }
}