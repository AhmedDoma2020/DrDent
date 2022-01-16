import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/seintific_level_model.dart';
import 'package:dr_dent/Src/bloc/model/specialization_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/fetch_scientific_repo.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/fetch_specialization_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_available_insurances_repo.dart';
import 'package:get/get.dart';

class FetchScientificController extends GetxController {
  List<ScientificModel> _scientificList = [];
  List<ScientificModel> get scientificList => _scientificList;
  List<int> _insurancesIdList = [];
  List<int> get insurancesIdList => _insurancesIdList;
  int _scientificIndex = -1;
  int get scientificIndex => _scientificIndex;
  void changeSIndex(index ) {
    // int indexWhere = _scientificList.indexWhere((element) => id == element.id );
    // print("index $index");
    // print("id $id");
    // print("indexWhere $indexWhere");
    _scientificIndex = index;
    // _scientificList[indexWhere].selected = true;
    update();
  }
  RequestStatus status = RequestStatus.initial;
  final FetchScientificRepository _fetchScientificRepository =
  FetchScientificRepository();
  Future<void> fetchScientific() async {
    // _scientificList = [...scientificListExamples];
    update();
    var response = await _fetchScientificRepository.fetchScientific();
    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      _scientificList.clear();
      for (var item in response.data['data']) {
        _scientificList.add(ScientificModel.fromJson(item));
      }
      print("convert operation success");
      status = RequestStatus.done;
      update();
    } else {
      status = RequestStatus.error;
      update();
    }
  }
  @override
  void onInit() {
    super.onInit();
    fetchScientific();
    _insurancesIdList=[];
  }
}
