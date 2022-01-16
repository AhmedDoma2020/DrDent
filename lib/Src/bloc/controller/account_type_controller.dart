

import 'package:dr_dent/Src/bloc/model/account_type_model.dart';
import 'package:get/get.dart';


class AccountTypeController extends GetxController{
  late int isCompanySelected =-1;
  selectCompanyIndex(index){
    isCompanySelected=index;
    update();
  }
  late int isCompanyMedicalSelected =-1;
  selectCompanyMedicalIndex(index){
    isCompanyMedicalSelected=index;
    update();
  }



  List<AccountTypeModel> _accountType = [];
  List<AccountTypeModel> get accountType => _accountType;
  List<AccountTypeModel> _medicalCompanyType = [];
  List<AccountTypeModel> get medicalCompanyType => _medicalCompanyType;


  @override
  void onInit() {
    super.onInit();
    _accountType=accountTypeList;
    _medicalCompanyType=medicalCompanyTypeList;
  }
}