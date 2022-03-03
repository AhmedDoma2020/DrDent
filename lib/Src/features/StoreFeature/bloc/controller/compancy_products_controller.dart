import 'package:dr_dent/Src/bloc/model/adds.dart';
import 'package:dr_dent/Src/bloc/model/product.dart';
import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalMyProductFeature/MyProductFeature/Bloc/Repository/company_delete_product_repo.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/all_products_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/company_products_repository.dart';
import 'package:dr_dent/Src/features/StoreFeature/bloc/repository/store_repository.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompanyProductsController extends GetxController{

  RequestStatus status = RequestStatus.initial;
  List<Product> _products = [];
  List<Product> get products => _products;


  final storeId;


  CompanyProductsController({required this.storeId});

  bool _isGrid = false;
  bool get isGrid => _isGrid;
  void changeIsGrid(){
    _isGrid = !_isGrid;
    update();
  }






  // ========== START FETCH DATA  ====================
  final CompanyProductsRepository _productsRepository = CompanyProductsRepository();
  Future<void> fetchProducts()async{
    status = RequestStatus.loading;
    update();
    var response = await _productsRepository.fetchProducts(storeId: storeId);
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
  // ================  FUN DELETE PRODUCT LOCAL  ====================
  void deleteProductLocal(int id){
    int index = _products.indexWhere((element) => element.id == id);
    _products.removeAt(index);
    update();
  }

  // ================   DELETE PRODUCT  ====================
  final CompanyDeleteProductRepository _companyDeleteProductRepository = CompanyDeleteProductRepository();
  Future<void> deleteProduct({required int id})async{
    setLoading();
    var response = await _companyDeleteProductRepository.companyDeleteProduct(productId:id );
    Get.back();
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      deleteProductLocal(id);
      customSnackBar(title: response.data["message"]??"");
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.error;
      customSnackBar(title: response.data["message"]??"");
      update();
    }
  }

  // ================  END FETCH DATA  ====================
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

}