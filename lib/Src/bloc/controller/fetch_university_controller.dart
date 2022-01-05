import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/bloc/model/univeristy_model.dart';
import 'package:dr_dent/Src/bloc/repository/fetch_university_repo.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_available_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_available_services_repo.dart';
import 'package:get/get.dart';

class FetchUniversityController extends GetxController {
  List<ChoiceModel> _universityList = [];
  List<ChoiceModel> get universityList => _universityList;

  // void changeSelectServices({ required int servicesIndex}){
  //   _ServicesList[servicesIndex].active = !_ServicesList[servicesIndex].active;
  //   update();
  // }

  int _universitySIndex = -1;
  int get universitySIndex => _universitySIndex;
  void changeSIndex(value) {
    _universitySIndex = value;
    update();
  }

  RequestStatus status = RequestStatus.initial;
  final FetchUniversityRepository _fetchUniversityRepository = FetchUniversityRepository();
  Future<void> fetchUniversity() async {
    _universityList = [...choiceModelExamples];
    update();
    // var response =
    //     await _fetchUniversityRepository.fetchUniversity();
    // if (response.statusCode == 200 && response.data["status"] == true) {
    //   print("request operation success");
    //   _universityList.clear();
    //   for (var item in response.data['data']) {
    //     _universityList.add(UniversityModel.fromJson(item));
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
    fetchUniversity();
    print("_universitySIndex $_universitySIndex");
  }
}
