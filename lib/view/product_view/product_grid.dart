import 'package:flutter/material.dart';
import 'package:shop/view/product_view/product_card.dart';

import '../../model/product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> producList;
  const ProductGrid({super.key,required this.producList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 2/3,crossAxisSpacing: 10,mainAxisSpacing: 10),
        physics:const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: producList.length,
        itemBuilder: (context,index) => ProductCard(product: producList[index])
    );
  }
}
