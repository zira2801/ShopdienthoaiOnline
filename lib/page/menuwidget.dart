import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/component/mainheader.dart';
import 'package:shop/controller/controllers.dart';
import 'package:shop/view/product_view/product_grid.dart';
import 'package:shop/view/product_view/product_loading_grid.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

 int _selectedIndex = 0;
  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
       const MainHeader(),
        Expanded(child: Obx(() {
          if(productController.isProductLoading.value){
            return const ProductLoadingGrid();
          }
          else{

            if(productController.productList.isNotEmpty){
              return ProductGrid(producList: productController.productList);
            }
            else{
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('assets/search_not_found.png',),
                        const SizedBox(height: 10,),
                        Text("Không tìm thấy sản phẩm!",style: TextStyle(color: Colors.grey.shade800,fontSize: 18),)
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        }))
      ],
    )) ;
  }
}
