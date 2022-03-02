import 'package:dr_dent/Src/bloc/model/adds.dart';
import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/all_products_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/like_product_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/store_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LikeProductController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  // ========== START FETCH DATA  ====================
  final LikeProductRepository _likeProductRepository = LikeProductRepository();
  Future<void> likeProduct({required int id , required VoidCallback onSuccess})async{
    var response = await _likeProductRepository.likeProduct(productId: id);
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      onSuccess();
      debugPrint("convert operation success");
    }else{

    }
  }

}