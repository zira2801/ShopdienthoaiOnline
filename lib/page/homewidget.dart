import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/component/mainheader.dart';
import 'package:shop/controller/controllers.dart';
import 'package:shop/view/slider_view/carouse_slider_view.dart';

import '../loading/carouseSliderHome.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: Column(
        children: [
        const  MainHeader(),
          Obx(() {
            if(homeController.bannerList.isNotEmpty){
              return CarouselSliderView(listBanner: homeController.bannerList,);
            }
            else{
             return CarouseLoading();
            }
          })
        ],
      ),
    ));
  }
}