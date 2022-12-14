import 'package:advance_foodapp/model/api_client.dart';
import 'package:advance_foodapp/model/controllers/popular_food_controller.dart';
import 'package:advance_foodapp/model/repository/popular_food_repo.dart';
import 'package:advance_foodapp/model/repository/recommended_food_repo.dart';
import 'package:advance_foodapp/presentation/app_const.dart';
import 'package:get/get.dart';

import 'controllers/recommended_food_controller.dart';


Future<void> init()async {
  Get.lazyPut(()=>ApiClient(appUrl: AppConstants.Base_Url));

  Get.lazyPut(() => PopularFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() =>RecommendedFoodRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularFoodController(popularFoodRepo: Get.find()));
  Get.lazyPut(() => RecommendedFoodController(recommendedFoodRepo: Get.find()));

}