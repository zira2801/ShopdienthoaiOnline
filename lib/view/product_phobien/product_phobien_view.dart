import 'package:flutter/material.dart';
import 'package:shop/view/product_phobien/product_phobien_card.dart';

import '../../model/product.dart';

class ProductPhoBienView extends StatelessWidget {
  final List<Product> listProductPhoBien;
  const ProductPhoBienView({super.key,required this.listProductPhoBien});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,itemCount: listProductPhoBien.length,itemBuilder: (context,index) => ProductPhoBienCard(product: listProductPhoBien[index])),
    );;
  }
}
