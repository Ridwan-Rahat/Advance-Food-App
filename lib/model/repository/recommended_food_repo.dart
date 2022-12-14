import 'package:advance_foodapp/model/api_client.dart';
import 'package:advance_foodapp/presentation/app_const.dart';
import 'package:get/get.dart';

class RecommendedFoodRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedFoodRepo({required this.apiClient});

  Future<Response>getRecommendedFoodList()async{
    return await apiClient.getData(AppConstants.Recommended_Product_Uri);

  }
}