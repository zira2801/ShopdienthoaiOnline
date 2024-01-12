import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop/model/ad_banner.dart';
import 'package:shop/model/category.dart';
import 'package:shop/model/product.dart';
import 'package:shop/page/homepage.dart';
import 'package:shop/route/app_page.dart';
import 'package:shop/route/app_route.dart';
import 'package:shop/view/dasdbord_binding.dart';

import 'Provider/tab_provider.dart';
import 'package:provider/provider.dart';

import 'model/tag_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //register adapter
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(TagAdapter());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TabProvider())
    ],
    child: const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialBinding: DashboardBinding(),
      initialRoute: AppRoute.dasdboard,
      debugShowCheckedModeBanner: false,
    );
  }
}
