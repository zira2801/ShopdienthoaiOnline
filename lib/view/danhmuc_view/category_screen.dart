import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/controllers.dart';
import 'package:shop/view/category_view/categorycard.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(categoryController.categoryList.isNotEmpty){
        return ListView.builder(physics: BouncingScrollPhysics(),itemCount: categoryController.categoryList.length,itemBuilder: (context,index) => CategoryCard(category: categoryController.categoryList[index]));
      }
      else{
        return Container();
      }
    });
  }
}
