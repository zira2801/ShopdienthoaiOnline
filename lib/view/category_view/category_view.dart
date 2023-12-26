import 'package:flutter/material.dart';
import 'package:shop/model/category.dart';
import 'package:shop/view/category_view/categorycard.dart';


class CategoryView extends StatefulWidget {
  final List<Category> listCategory;
  const CategoryView({super.key,required this.listCategory});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listCategory.length,
          itemBuilder: (context,index) => CategoryCard(category: widget.listCategory[index],)),
    );
  }
}
