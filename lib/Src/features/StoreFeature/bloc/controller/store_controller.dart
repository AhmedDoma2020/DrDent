import 'package:dr_dent/Src/bloc/model/adds.dart';
import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/store_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StoreController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  List<Product> _products = [];
  List<Product> get products => _products;

  List<Product> _recentlyProducts = [];
  List<Product> get recentlyProducts => _recentlyProducts;

  List<Store> _stores = [];
  List<Store> get stores => _stores;

  List<Adds> _adds = [];
  List<Adds> get adds => _adds;

  // ========== START FETCH DATA  ====================
  final StoreRepository _storeRepository = StoreRepository();
  Future<void> fetchStore()async{
    status = RequestStatus.loading;
    update();
    var response = await _storeRepository.fetchStore();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        _products.clear();
        _recentlyProducts.clear();
        _stores.clear();
        _adds.clear();
        if(response.data['data']['adds']!=null){
          for (var item in response.data['data']['adds']) {
            _adds.add(Adds.fromJson(item));
          }
        }
        if(response.data['data']['recently_products']!=null){
          for (var item in response.data['data']['recently_products']) {
            _recentlyProducts.add(Product.fromJson(item));
          }
        }
        if(response.data['data']['stores']!=null){
          for (var item in response.data['data']['stores']) {
            _stores.add(Store.fromJson(item));
          }
        }
        if(response.data['data']['products']!=null){
          for (var item in response.data['data']['products']) {
            _products.add(Product.fromJson(item));
          }
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



  void handleLikeProduct({required int id , required int status}){
    print('a8aaaaaaaaaaaaaaaaaaaaaaa999999');
    int _recentlyProductIndex = _recentlyProducts.indexWhere((element) => element.id==id);
    int _allProductIndex = _products.indexWhere((element) => element.id==id);
    if(_recentlyProductIndex>-1){

      _recentlyProducts[_recentlyProductIndex].like=status;
      print(' _recentlyProducts[_recentlyProductIndex].like id ${_recentlyProducts[_recentlyProductIndex].like}');
    }
    if(_allProductIndex>-1){
      _products[_allProductIndex].like=status;
      print(' _products[_recentlyProductIndex].like id ${_products[_allProductIndex].like}');
    }
    update();
  }


  @override
  void onInit() {
    super.onInit();
    fetchStore();
  }

}