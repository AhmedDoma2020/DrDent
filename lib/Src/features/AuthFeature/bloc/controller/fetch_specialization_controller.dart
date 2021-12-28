import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/specialization_model.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/fetch_specialization_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_available_insurances_repo.dart';
import 'package:get/get.dart';

class FetchSpecializationController extends GetxController {
  List<SpecializationModel> _specializationList = [];
  List<SpecializationModel> get specializationList => _specializationList;

  List<int> _specializationIdList = [];
  List<int> get specializationIdList => _specializationIdList;
  List<String> _specializationTitleList = [];
  List<String> get specializationTitleList => _specializationTitleList;

  void changeSelectInsurance({ required int insuranceIndex}){
    _specializationList[insuranceIndex].active = !_specializationList[insuranceIndex].active;
    update();
  }
  RequestStatus status = RequestStatus.initial;
  final FetchSpecializationRepository _fetchSpecializationRepository =
  FetchSpecializationRepository();
  Future<void> fetchSpecialization() async {
    _specializationList = [...specializationListExamples];
    update();
    // var response =
    //     await _fetchSpecializationRepository.fetchSpecialization();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   _specializationList.clear();
    //   for (var item in response.data['waitingOrder']) {
    //     _specializationList.add(SpecializationModel.fromJson(item));
    //   }
    //   print("convert operation success");
    //   status = RequestStatus.done;
    //   update();
    // } else {
    //   status = RequestStatus.error;
    //   update();
    // }
  }
  @override
  void onInit() {
    super.onInit();
    fetchSpecialization();
    _specializationIdList=[];
    _specializationTitleList=[];
  }
}
