import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/delete_insurance_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Repo/fetch_my_insurances_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Repo/delete_assistant_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/delete_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Repo/fetch_my_services_repo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_profile_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FetchProfileController extends GetxController {
    String? _phone;
    String? _name;
    String? _avatar;
    String? _cover;
    String? _degreeTitle;
    int? _degreeId;
    String? _specialization;
    String? _yearsOfExperience;
    String? _photoOfWorkLicenses;
    double? _rateAverage;
    double? _rateNum;
    int? _patientsNum;
    int? _followersNum;
    int? _followingNum;
    String? _gender;
    int? _userTypeId;
    List<String> _specializationList = [];
    List<int> _specializationIds = [];
    String? get phone => _phone;
    String? get name => _name;
    String? get avatar => _avatar;
    String? get cover => _cover;
    String? get degreeTitle => _degreeTitle;
    int? get degreeId => _degreeId;
    String? get specialization => _specialization;
    List<String> get specializationList => _specializationList;
    List<int> get specializationIds => _specializationIds;
    String? get yearsOfExperience => _yearsOfExperience;
    String? get photoOfWorkLicenses => _photoOfWorkLicenses;
    double? get rateAverage => _rateAverage;
    double? get rateNum => _rateNum;
    int? get patientsNum => _patientsNum;
    int? get followersNum => _followersNum;
    int? get followingNum => _followingNum;
    String? get gender => _gender;
    int? get userTypeId => _userTypeId;
  RequestStatus status = RequestStatus.initial;
  final FetchProfileDoctorRepository _fetchProfileDoctorRepository = FetchProfileDoctorRepository();
  Future<void> fetchProfileDoctor() async {
    status = RequestStatus.loading;
    var response = await _fetchProfileDoctorRepository.fetchProfileDoctor();
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _phone = response.data['data']['phone']??"";
      _name = response.data['data']['name']??"";
      _avatar = response.data['data']['image']??"";
      _cover = response.data['data']['cover']??"";
      _degreeTitle = response.data['data']['scientificlevel']["title"]??"";
      _degreeId = response.data['data']['scientificlevel']["id"]??0;
      // debugPrint("_photoOfWorkLicenses in controller is ${response.data['data']['work_lisence']}");
      _photoOfWorkLicenses = response.data['data']['work_lisence']??"";
      if(response.data['data']['specializations'] != null ){
        _specializationList.clear();
        _specializationIds.clear();
        for(var item in response.data['data']['specializations']){
          String itemTitle = item['title'];
          int itemId = item['id'];
          _specializationList.add(itemTitle);
          _specializationIds.add(itemId);
        }
        _specialization = _specializationList.join(",");
        debugPrint("_specialization $_specialization");
      }else{
        _specialization="";
      }
      _yearsOfExperience = response.data['data']['experience_years'].toString();
      _rateAverage = double.parse((response.data['data']['average_rate']??0.0).toString());
      _rateNum = double.parse((response.data['data']['rate_number']??0).toString());
      _patientsNum = response.data['data']['patients']??0;
      _followersNum = response.data['data']['followers_number']??0;
      _followingNum = response.data['data']['followings_number']??0;
      _gender = response.data['data']['gender']??"UnKnow";
      _userTypeId = response.data['data']['user_type_id']??0;
      debugPrint("convert operation success");
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
