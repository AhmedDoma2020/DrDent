import 'package:dr_dent/Src/bloc/model/adds.dart';
import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/all_products_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/store_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  List<Product> _products = [];
  List<Product> get products => _products;


  List<Product> _searchProducts = [];
  List<Product> get searchProducts => _searchProducts;


  bool isSearch = false;


  bool _isGrid = false;
  bool get isGrid => _isGrid;
  void changeIsGrid(){
    _isGrid = !_isGrid;
    update();
  }




  // ========== START FETCH DATA  ====================
  final AllProductsRepository _productsRepository = AllProductsRepository();
  Future<void> fetchAllProducts()async{
    status = RequestStatus.loading;
    update();
    var response = await _productsRepository.fetchAllProducts();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        _products.clear();
        for (var item in response.data['data']) {
          _products.add(Product.fromJson(item));
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



  void searchWord({String word=''}){
    if(word.isNotEmpty){
      isSearch = true;
    }else{
      isSearch = false;
    }
    _searchProducts.clear();
       _products.forEach((element) {
         if(element.title!.contains(word)){
            _searchProducts.add(element);
         }
       });
       update();
    _searchProducts.forEach((element) {
      print('-------- ${element.title} ----------');
    });
  }



  void handleLikeProduct({required int id , required int status}){
    print('a8aaaaaaaaaaaaaaaaaaaaaaa999999');
    int _productIndex = _products.indexWhere((element) => element.id==id);
    int _searchProductIndex = _searchProducts.indexWhere((element) => element.id==id);
    if(_productIndex>-1){
      _products[_productIndex].like=status;
    }
    if(_searchProductIndex>-1){
      _searchProducts[_searchProductIndex].like=status;
    }
    update();
  }




  // ================  END FETCH DATA  ====================
  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

}