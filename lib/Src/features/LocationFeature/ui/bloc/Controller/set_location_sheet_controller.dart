import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/bloc/Model/city_model.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/bloc/Repo/fetch_citys_repo.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/bloc/Repo/set_location_sheet_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class FetchCityAndSetLocationSheetController extends GetxController{
  RequestStatus status= RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController? cityController= TextEditingController();
  TextEditingController? buildNumController= TextEditingController();
  TextEditingController? flatNumController= TextEditingController();
  TextEditingController? spMarkController= TextEditingController();
  List<CityModel>? _cityList;
  List<CityModel>? get cityList => _cityList;

  int? _citySelected;
  int? get citySelected => _citySelected;
  // String? _citySelectedTitle;
  // String? get citySelectedTitle => _citySelectedTitle;
  set setCitySelectedId(int value) {
    _citySelected = value;
    update();
  }
  set setCitySelectedTitle(String? value) {
    // _citySelectedTitle = value;
    cityController!.text=value!;
    update();
  }

  int? _areaSelectedId;
  int? get areaSelectedId => _areaSelectedId;
  set setAreaSelectedId(int value) {
    _areaSelectedId = value;
    update();
  }


  CityRepository _cityRepository = CityRepository();
  void fetchCity() async{
    _cityList = [
      CityModel(
        id: 1,
        title: "Mansura",
      ),
      CityModel(
        id: 2,
        title: "Mahalla",
      ),
    ];
    // setLoading();
    status = RequestStatus.loading;
    var response = await _cityRepository.fetchCity();
    // Get.back();
    if (response.statusCode == 200 && response.data["status"] == true) {
      // _cityList.clear();
      // print("request operation success");
      // if(response.data['data']!=null){
      //   for(var item in response.data['data']){
      //     _cityList.add(CityModel.fromJson(item));
      //   }
      // }
      // print("convert operation success");
      // status = RequestStatus.done;
      // update();
    }else{
      status = RequestStatus.done;
      update();
      // snackBarDefault(title: response.data['message']??' ',errorMessage: true);
      customSnackBar(title: "Error_".tr,subtitle:  response.data['message']??' ');
    }
  }


  // List<CityModel> _areaList=[];
  // List<CityModel>? get areaList => _areaList;
  // AreaRepository _areaRepository = AreaRepository();
  // void fetchArea({required int cityId}) async{
  //   // setLoading();
  //   status = RequestStatus.loading;
  //   var response = await _areaRepository.fetchArea(cityId:cityId );
  //   // Get.back();
  //   if (response.statusCode == 200 && response.data["status"] == true) {
  //     _areaList.clear();
  //     print("request operation success");
  //     if(response.data['data']!=null){
  //       for(var item in response.data['data']){
  //         _areaList.add(CityModel.fromJson(item));
  //         update();
  //       }
  //     }
  //     print("convert operation success");
  //     status = RequestStatus.done;
  //     update();
  //   }else{
  //     status = RequestStatus.done;
  //     update();
  //     // snackBarDefault(title: response.data['message']??' ',errorMessage: true);
  //     customSnackBar(title: "Error_".tr,subtitle:  response.data['message']??' ');
  //   }
  // }

  SetLocationSheetRepository _setCityAndAreaRepository = SetLocationSheetRepository();
  void submit() async{
    if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();
      setLoading();
      status = RequestStatus.loading;
      var response = await _setCityAndAreaRepository.setCityAndArea(cityId: citySelected,buildNum: buildNumController!.text,flat:flatNumController!.text ,spMArk:spMarkController!.text,);
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        print("request operation success");
        if(response.data['data']!=null){
          // Get.offAll(()=>WaitingConfirmationScreen());
        }
        print("convert operation success");
        status = RequestStatus.done;
        update();
      }else{
        status = RequestStatus.done;
        update();
        // snackBarDefault(title: response.data['message']??' ',errorMessage: true);
        customSnackBar(title: "Error_".tr,subtitle:  response.data['message']??' ');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCity();
    cityController = TextEditingController();
    buildNumController = TextEditingController();
    flatNumController = TextEditingController();
    spMarkController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cityController?.dispose();
    buildNumController?.dispose();
    flatNumController?.dispose();
    spMarkController?.dispose();
  }
}