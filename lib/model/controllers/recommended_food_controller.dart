
import 'package:advance_foodapp/model/repository/popular_food_repo.dart';
import 'package:get/get.dart';

import '../product_model.dart';
import '../repository/recommended_food_repo.dart';

class RecommendedFoodController extends GetxController{
  final RecommendedFoodRepo recommendedFoodRepo;
  RecommendedFoodController({required this.recommendedFoodRepo, popularFoodRepo});

  List<dynamic>_recommendedFoodList=[];
  List<dynamic> get recommendedFoodList=>_recommendedFoodList;
  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedFoodList() async{
    Response response =await recommendedFoodRepo.getRecommendedFoodList();
    if(response==200){
      _recommendedFoodList=[];
      _recommendedFoodList.addAll(PopularProduct.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{

    }

  }
}