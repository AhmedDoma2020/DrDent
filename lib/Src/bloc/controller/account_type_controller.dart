

import 'package:dr_dent/Src/bloc/model/account_type_model.dart';
import 'package:get/get.dart';


class AccountTypeController extends GetxController{
  late int isSelected =-1;
  selectIndex(index){
    isSelected=index;
    update();
  }
  List<AccountTypeModel> _accountType = [];
  List<AccountTypeModel> get accountType => _accountType;

  @override
  void onInit() {
    super.onInit();
    _accountType=accountTypeList;
  }
}