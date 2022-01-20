import 'package:dr_dent/Src/bloc/model/adds.dart';
import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/all_products_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/all_stores_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/store_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AllStoresController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  List<Store> _stores = [];
  List<Store> get stores => _stores;




  bool _isGrid = false;
  bool get isGrid => _isGrid;
  void changeIsGrid(){
    _isGrid = !_isGrid;
    update();
  }


  // ========== START FETCH DATA  ====================
  final AllStoresRepository _allStoresRepository = AllStoresRepository();
  Future<void> fetchAllStores()async{
    status = RequestStatus.loading;
    update();
    var response = await _allStoresRepository.fetchAllStores();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        _stores.clear();
        for (var item in response.data['data']) {
          _stores.add(Store.fromJson(item));
        }
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.error;
      update();
    }
  }
  // ================  END FETCH DATA  ====================
  @override
  void onInit() {
    super.onInit();
    fetchAllStores();
  }
}