import 'package:get/get.dart';
import 'package:katatarahatalk/controllers/popular_product_controller.dart';
import 'package:katatarahatalk/controllers/recommended_product_controller.dart';
import 'package:katatarahatalk/data/api/api_client.dart';
import 'package:katatarahatalk/data/repository/popular_product_repo.dart';
import 'package:katatarahatalk/data/repository/recommended_product_repo.dart';
import 'package:katatarahatalk/utils/app_constants.dart';

Future<void> init()async {
  //api client
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repositories and controllers as before
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));

}