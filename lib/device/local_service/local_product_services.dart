import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/product.dart';


class LocalProductService {
  late Box<Product> _ProductPhoBienBox;

  Future<void> init() async {
    _ProductPhoBienBox = await Hive.openBox("ProductPhoBien");

  }

  Future<void> assignAllProductPhoBien({required List<Product> listProductPhoBien}) async {
    await _ProductPhoBienBox.clear();
    await _ProductPhoBienBox.addAll(listProductPhoBien);
  }

  List<Product> getListProductPhoBien() => _ProductPhoBienBox.values.toList();
}