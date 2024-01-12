import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop/controller/controllers.dart';
import 'package:shop/page/menuwidget.dart';
import 'package:provider/provider.dart';
import '../Provider/tab_provider.dart';
import '../device/remote_product.dart';
import '../model/product.dart';
import '../page/homepage.dart';
class MainHeader extends StatefulWidget {
  const MainHeader({super.key});

  @override
  State<MainHeader> createState() => _MainHeaderState();
}
    List<String> productNames = [];
    void getListNameProduct() async {
      var response = await RemoteProductService().getProductNames();

      if (response != null) {

        var products = ProductListFromJson(response.body);

        for (var product in products) {
          productNames.add(product.name);
        }

      }}
class _MainHeaderState extends State<MainHeader> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10
          )
        ]
      ),

      padding: const EdgeInsets.all(15),

      child: Row(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(24)
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(0, 0),
                  blurRadius: 8
                )
              ]
            ),
            child: Obx(() => TextField(
              autofocus: false,
              controller: productController.searchEditController,
              onSubmitted: (val) {
                productController.getProductByName(keyword: val);
                Provider.of<TabProvider>(context, listen: false).updateTab(1);
              },
              onChanged: (val) {
                productController.searchVal.value = val;
              },
              decoration: InputDecoration(
                suffixIcon: productController.searchVal.value.isNotEmpty?
                  IconButton(onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());  //FocusScope là kiểu như mình sẽ focus cho textfield nào khi nó submit cái textfield trước đó
                    productController.searchEditController.clear();
                    productController.searchVal.value = '';
                    productController.getProducts();
                  }, icon: const Icon(Icons.clear)) : null,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  fillColor: Colors.white,
                  filled: false,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none
                  ),
                  hintText: "Search...",
                  hintStyle: const TextStyle(fontSize: 15),
                  prefixIcon: const Icon(Icons.search_outlined)
              ),
            )),

          )),
          const SizedBox(width: 10,),
          Container(height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 8
              )
            ]
          ),
          padding: const EdgeInsets.all(12),
            child: const Icon(Icons.filter_alt,color: Colors.grey,),
          ),
          const SizedBox(width: 10,),

          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -13, end: -3),
            badgeContent: const Text('1',style: TextStyle(color: Colors.white),),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              padding: const EdgeInsets.all(5),
              badgeColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8
                    )
                  ]
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.shopping_cart,color: Colors.grey,),
            ),
          )],
      ),
    );
  }
}
