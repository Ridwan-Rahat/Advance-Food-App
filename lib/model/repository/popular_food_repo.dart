import 'package:advance_foodapp/model/api_client.dart';
import 'package:advance_foodapp/presentation/app_const.dart';
import 'package:get/get.dart';

class PopularFoodRepo extends GetxService{
  final ApiClient apiClient;
  PopularFoodRepo({required this.apiClient});

  Future<Response>getPopularFoodList()async{
    return await apiClient.getData(AppConstants.Popular_Product_Uri);

  }
}