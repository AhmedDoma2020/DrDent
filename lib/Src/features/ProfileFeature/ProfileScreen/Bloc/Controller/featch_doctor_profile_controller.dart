import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/AddAssistantDataFeature/Bloc/Repo/delete_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_doctor_profile_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';

class FetchProfileDoctorController extends GetxController {

    // String? _phone;
    // String? _name;
    // String? _avatar;
    // String? _cover;
    // List<String>? _specialization;
    // String? _yearsOfExperience;
  double? _rateAverage;
  int? _rateNum;
    String? _patientsNum;
    String? _followersNum;
    String? _followingNum;
    // String? get phone => _phone;
    // String? get name => _name;
    // String? get avatar => _avatar;
    // String? get cover => _cover;
    // List<String>? get specialization => _specialization;
    // String? get yearsOfExperience => _yearsOfExperience;
    double? get rateAverage => _rateAverage;
    int? get rateNum => _rateNum;
    String? get patientsNum => _patientsNum;
    String? get followersNum => _followersNum;
    String? get followingNum => _followingNum;
  RequestStatus status = RequestStatus.initial;
  final FetchProfileDoctorRepository _fetchProfileDoctorRepository = FetchProfileDoctorRepository();
  Future<void> fetchProfileDoctor() async {
    var response = await _fetchProfileDoctorRepository.fetchProfileDoctor();
    if (response.statusCode == 200 && response.data["status"] == true) {
      print("request operation success");
      // _phone = response.data['data']['phone']??"";
      // _name = response.data['data']['name']??"";
      // _avatar = response.data['data']['avatar']??"";
      // _cover = response.data['data']['cover']??"";
      // _specialization = response.data['data']['specialization']??[];
      // _yearsOfExperience = response.data['data']['years_of_experience']??0;
      _rateAverage = response.data['data']['rate_average']??0.0;
      _rateNum = response.data['data']['rate_num']??0;
      _patientsNum = response.data['data']['patients_num']??0;
      _followersNum = response.data['data']['followers_num']??0;
      _followingNum = response.data['data']['following_num']??0;
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
    fetchProfileDoctor();
  }


}
