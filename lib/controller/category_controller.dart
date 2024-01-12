import 'package:get/get.dart';
import 'package:shop/device/local_service/local_category_services.dart';
import 'package:shop/device/remote_category_service.dart';
import 'package:shop/model/category.dart';

class CategoryController extends GetxController{
  static CategoryController instance = Get.find();

  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;

  final LocalCategoryService localCategoryService = LocalCategoryService();
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    await localCategoryService.init();
    getCatgories();
    super.onInit();
  }
  void getCatgories() async {
    try{
      isCategoryLoading(true);
      if(localCategoryService.getListCategory().isNotEmpty){
        categoryList.assignAll(localCategoryService.getListCategory());
      }
      var rs = await RemoteCategoryService().get();
      if(rs != null){
        categoryList.assignAll(categoryListFromJson(rs.body));
        localCategoryService.assignAllCategory(listCategory: CategoryListFromJson(rs.body));
      }
    }
    finally{
      isCategoryLoading(false);
      print(categoryList.length);
    }
  }
}