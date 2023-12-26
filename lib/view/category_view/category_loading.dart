import 'package:flutter/material.dart';
import 'package:shop/view/category_view/category_loading_card.dart';


class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,itemCount: 5,itemBuilder: (context,index) => const CategoryLoadingCard()),
    );
  }
}
