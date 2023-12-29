import 'package:get/get.dart';
import 'package:shop/device/local_service/local_adbanner.dart';
import 'package:shop/device/local_service/local_category_services.dart';
import 'package:shop/device/local_service/local_product_services.dart';
import 'package:shop/device/remote_banner.dart';
import 'package:shop/device/remote_category.dart';
import 'package:shop/device/remote_product_phobien.dart';
import 'package:shop/model/ad_banner.dart';
import 'package:shop/model/category.dart';
import 'package:shop/model/product.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> PhoBiencategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> PhoBienproductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isCategoryPhoBienLoading = false.obs;
  RxBool isProductPhoBienLoading = false.obs;

  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
   final LocalCategoryService _localCategoryService = LocalCategoryService();
    final LocalProductService _localProductService = LocalProductService();
  @override
  void onInit() async {
    // TODO: implement onInit
   await _localAdBannerService.init();
   await _localCategoryService.init();
   await _localProductService.init();
    getAdBanners();
    getCategory();
    getProductPhoBien();
    super.onInit();
  }
  void getAdBanners() async{
    try{
    isBannerLoading(true);

    if(_localAdBannerService.getAdBanner().isNotEmpty){
      bannerList.assignAll(_localAdBannerService.getAdBanner());
    }
    var result = await RemoteBannerService().get();
    if(result != null){
      bannerList.assignAll(adBannerListFromJson(result.body));
      _localAdBannerService.assignAllAdBanners(adBanners: adBannerListFromJson(result.body));
    }
    }
    finally{
      print(bannerList.length);
      isBannerLoading(false);
    }
  }

  void getCategory() async{
    try{
      isCategoryPhoBienLoading(true);
      if(_localCategoryService.getListCategoryPhoBien().isNotEmpty){
        PhoBiencategoryList.assignAll(_localCategoryService.getListCategoryPhoBien());
      }
      var result = await RemoteCategory().get();
      if(result != null){
        PhoBiencategoryList.assignAll(CategoryListFromJson(result.body));
        _localCategoryService.assignAllCategoryPhoBien(listCategoryPhoBien: CategoryListFromJson(result.body));
      }
    }
    finally{
      print(PhoBiencategoryList.length);
      isCategoryPhoBienLoading(false);
    }
  }

  void getProductPhoBien() async{
    try{
      isProductPhoBienLoading(true);
      if(_localProductService.getListProductPhoBien().isNotEmpty){
        PhoBienproductList.assignAll(_localProductService.getListProductPhoBien());
      }
      var result = await RemoteProductPhobien().get();
      if(result != null){
        PhoBienproductList.assignAll(ProductPhoBienListFromJson(result.body));
        _localProductService.assignAllProductPhoBien(listProductPhoBien: ProductPhoBienListFromJson(result.body));
      }
    }
    finally{
      print(PhoBienproductList.length);
      isProductPhoBienLoading(false);
    }
  }
}
