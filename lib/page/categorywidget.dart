import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/controllers.dart';
import '../view/danhmuc_view/component/category_card.dart';
import '../view/danhmuc_view/component/category_loading_card.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(categoryController.categoryList.isNotEmpty){
        return ListView.builder(physics: BouncingScrollPhysics(),itemCount: categoryController.categoryList.length,itemBuilder: (context,index) => CategoryCard(category: categoryController.categoryList[index]));
      }
      else{
        return const CategoryLoadingCard();
      }
    });
  }
}
