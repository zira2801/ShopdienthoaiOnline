import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/component/mainheader.dart';
import 'package:shop/controller/controllers.dart';
import 'package:shop/view/category_view/category_loading.dart';
import 'package:shop/view/category_view/category_titile.dart';
import 'package:shop/view/category_view/category_view.dart';
import 'package:shop/view/product_phobien/ProductPhoBien_title.dart';
import 'package:shop/view/product_phobien/product_phobien_loading.dart';
import 'package:shop/view/product_phobien/product_phobien_view.dart';
import 'package:shop/view/slider_view/carouse_slider_view.dart';

import '../loading/carouseSliderHome.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: Column(
        children: [
         const MainHeader(),
          Expanded(child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(children: [
              Obx(() {
                if(homeController.bannerList.isNotEmpty){
                  return CarouselSliderView(listBanner: homeController.bannerList,);
                }
                else{
                  return const CarouseLoading();
                }
              }),
              const CategoryTitle(titile: "Danh mục phổ biến"),
              Obx(() {
                if(homeController.PhoBiencategoryList.isNotEmpty){
                  return CategoryView(listCategory: homeController.PhoBiencategoryList,);
                }
                else{
                  return const CategoryLoading();
                }
              }),
              const SizedBox(height: 10,),
              const ProductPhoBienTitle(titile: "Điện thoại bán nhiều nhất"),
              Obx(() {
                if(homeController.PhoBienproductList.isNotEmpty){
                  return ProductPhoBienView(listProductPhoBien: homeController.PhoBienproductList) ;
                }
                else{
                  return const ProductPhoBienLoading() ;
                }
              }),
            ],),
          ))
        ],
      ),
    ));
  }
}