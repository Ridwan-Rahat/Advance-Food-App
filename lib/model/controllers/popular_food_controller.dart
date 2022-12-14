import 'package:advance_foodapp/model/product_model.dart';
import 'package:advance_foodapp/model/repository/popular_food_repo.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController{
  final PopularFoodRepo popularFoodRepo;
  PopularFoodController({required this.popularFoodRepo});

  List<dynamic>_popularFoodList=[];
  List<dynamic> get popularFoodList=>_popularFoodList;
  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  Future<void> getPopularFoodList() async{
    Response response =await popularFoodRepo.getPopularFoodList();
    if(response==200){
      _popularFoodList=[];
       _popularFoodList.addAll(PopularProduct.fromJson(response.body).products);
       _isLoaded = true;
      update();
    }else{
      
    }

  }
}