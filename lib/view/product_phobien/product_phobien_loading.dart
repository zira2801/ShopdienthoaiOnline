import 'package:flutter/material.dart';
import 'package:shop/view/product_phobien/product_phobien_loading_card.dart';

class ProductPhoBienLoading extends StatelessWidget {
  const ProductPhoBienLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,itemCount: 5,itemBuilder: (context,index) => const ProductPhoBienLoadingCard()),
    );
  }
}
