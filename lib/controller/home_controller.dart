import 'package:get/get.dart';
import 'package:shop/device/remote_banner.dart';
import 'package:shop/model/ad_banner.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAdBanners();
    super.onInit();
  }
  void getAdBanners() async{
    try{
    isBannerLoading(true);
    var result = await RemoteBannerService().get();
    if(result != null){
      bannerList.assignAll(adBannerListFromJson(result.body));
    }
    }
    finally{
      print(bannerList.length);
      isBannerLoading(false);
    }
  }
}
