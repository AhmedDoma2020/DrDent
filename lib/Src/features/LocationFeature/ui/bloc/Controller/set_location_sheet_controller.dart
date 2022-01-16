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
  TextEditingController? stateController= TextEditingController();
  TextEditingController? buildNumController= TextEditingController();
  TextEditingController? flatNumController= TextEditingController();
  TextEditingController? spMarkController= TextEditingController();


  // int? _citySelected;
  // int? get citySelected => _citySelected;
  // // String? _citySelectedTitle;
  // // String? get citySelectedTitle => _citySelectedTitle;
  // set setCitySelectedId(int value) {
  //   _citySelected = value;
  //   update();
  // }
  // set setCitySelectedTitle(String? value) {
  //   // _citySelectedTitle = value;
  //   cityController!.text=value!;
  //   update();
  // }
  //
  // int? _areaSelectedId;
  // int? get areaSelectedId => _areaSelectedId;
  // set setAreaSelectedId(int value) {
  //   _areaSelectedId = value;
  //   update();
  // }
  //

  @override
  void onInit() {
    super.onInit();
    cityController = TextEditingController();
    buildNumController = TextEditingController();
    flatNumController = TextEditingController();
    spMarkController = TextEditingController();
    stateController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cityController?.dispose();
    buildNumController?.dispose();
    flatNumController?.dispose();
    spMarkController?.dispose();
    stateController?.dispose();
  }
}