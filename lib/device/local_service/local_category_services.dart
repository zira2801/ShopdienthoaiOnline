import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/category.dart';

class LocalCategoryService {
  late Box<Category> _CategoryPhoBienBox;
  late Box<Category> _CategoryBox;
  Future<void> init() async {
    _CategoryPhoBienBox = await Hive.openBox("CategoryPhoBien");
    _CategoryBox = await Hive.openBox("Category");
  }

  Future<void> assignAllCategoryPhoBien({required List<Category> listCategoryPhoBien}) async {
    await _CategoryPhoBienBox.clear();
    await _CategoryPhoBienBox.addAll(listCategoryPhoBien);
  }

  Future<void> assignAllCategory({required List<Category> listCategory}) async {
    await _CategoryBox.clear();
    await _CategoryBox.addAll(listCategory);
  }
    List<Category> getListCategoryPhoBien() => _CategoryPhoBienBox.values.toList();
  List<Category> getListCategory() => _CategoryBox.values.toList();
}