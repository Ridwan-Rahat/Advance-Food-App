import 'package:advance_foodapp/model/controllers/popular_food_controller.dart';
import 'package:advance_foodapp/ui/pages/details_page.dart';
import 'package:advance_foodapp/ui/pages/homepage.dart';
import 'package:advance_foodapp/ui/pages/popular_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/controllers/recommended_food_controller.dart';
import 'model/dependencies.dart'as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularFoodController>().getPopularFoodList();
    Get.find<RecommendedFoodController>().getRecommendedFoodList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

