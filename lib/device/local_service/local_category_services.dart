import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/category.dart';

class LocalCategoryService {
  late Box<Category> _CategoryPhoBienBox;

  Future<void> init() async {
    _CategoryPhoBienBox = await Hive.openBox("CategoryPhoBien");

  }

  Future<void> assignAllCategoryPhoBien({required List<Category> listCategoryPhoBien}) async {
    await _CategoryPhoBienBox.clear();
    await _CategoryPhoBienBox.addAll(listCategoryPhoBien);
  }

    List<Category> getListCategoryPhoBien() => _CategoryPhoBienBox.values.toList();
}