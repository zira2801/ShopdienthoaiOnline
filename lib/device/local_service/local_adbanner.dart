import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/ad_banner.dart';

class LocalAdBannerService {
  late Box<AdBanner> _adbannerBox;

  Future<void> init() async {
    _adbannerBox = await Hive.openBox<AdBanner>('AdBanners');
}

Future<void> assignAllAdBanners({ required List<AdBanner> adBanners}) async {
    await _adbannerBox.clear();
    await _adbannerBox.addAll(adBanners);
}
List<AdBanner> getAdBanner() => _adbannerBox.values.toList();
}
