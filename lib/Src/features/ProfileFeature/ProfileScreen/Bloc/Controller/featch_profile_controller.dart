import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/ProfileScreen/Bloc/Repo/featch_profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FetchProfileController extends GetxController {
  String? _phone;
  String? _name;
  String? _avatar;
  String? _cover;
  String _degreeTitle='';
  int _degreeId =0;
  String _specialization='';
  String? _yearsOfExperience;
  String _photoOfWorkLicenses='';
  double? _rateAverage;
  double? _rateNum;
  int? _patientsNum;
  int? _followersNum;
  int? _followingNum;
  String? _gender;
  int? _userTypeId;
  String _taxNum = '';
  String get taxNum => _taxNum;
  String _taxImage = '';
  String _logRecordNum = '';
  String _logRecordImage = '';
  String _countryTitle = '';
  String _stateTitle = '';
  String _cityTitle = '';
  String _address = '';
  String _administratorName ='';
  String _administratorPhone = '';
  String _about = '';
  String _yearOfGraduation = '';
  String _graduationYear = '';
  String _universityTitle = '';
  String _graduationDegree = '';
  int _universityId = 0;

  String get universityTitle => _universityTitle;
  String get graduationDegree => _graduationDegree;
  int get universityId => _universityId;
  String get graduationYear => _graduationYear;
  String get about => _about;
  String get yearOfGraduation => _yearOfGraduation;
  List<String> _specializationList = [];
  List<int> _specializationIds = [];
  String? get phone => _phone;
  String? get name => _name;
  String? get avatar => _avatar;
  String? get cover => _cover;
  String get degreeTitle => _degreeTitle;
  int get degreeId => _degreeId;
  String get specialization => _specialization;
  List<String> get specializationList => _specializationList;
  List<int> get specializationIds => _specializationIds;
  String? get yearsOfExperience => _yearsOfExperience;
  String get photoOfWorkLicenses => _photoOfWorkLicenses;
  double? get rateAverage => _rateAverage;
  double? get rateNum => _rateNum;
  int? get patientsNum => _patientsNum;
  int? get followersNum => _followersNum;
  int? get followingNum => _followingNum;
  String? get gender => _gender;
  int? get userTypeId => _userTypeId;
  String get taxImage => _taxImage;
  String get logRecordNum => _logRecordNum;
  String get logRecordImage => _logRecordImage;
  String get countryTitle => _countryTitle;
  String get stateTitle => _stateTitle;
  String get cityTitle => _cityTitle;
  String get address => _address;
  String get administratorPhone => _administratorPhone;
  String get administratorName => _administratorName;

  GetStorage  box = GetStorage();
  RequestStatus status = RequestStatus.initial;
  final FetchProfileDoctorRepository _fetchProfileDoctorRepository = FetchProfileDoctorRepository();

  Future<void> fetchProfileDoctor() async {
    status = RequestStatus.loading;
    var response = await _fetchProfileDoctorRepository.fetchProfileDoctor();
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      box.write('id', response.data['data']['id']);
      _phone = response.data['data']['phone'] ?? "";
      _name = response.data['data']['name'] ?? "";
      _avatar = response.data['data']['image'] ?? "";
      _cover = response.data['data']['cover'] ?? "";
      if (response.data['data']['scientificlevel'] == null ||
          response.data['data']['scientificlevel'] == "") {
      } else {
        _degreeTitle = response.data['data']['scientificlevel']["title"] ?? "";
        _degreeId = response.data['data']['scientificlevel']["id"] ?? 0;
      }
      // debugPrint("_photoOfWorkLicenses in controller is ${response.data['data']['work_lisence']}");
      _photoOfWorkLicenses = response.data['data']['work_lisence'] ?? "";
      if (response.data['data']['specializations'] != null) {
        _specializationList.clear();
        _specializationIds.clear();
        for (var item in response.data['data']['specializations']) {
          String itemTitle = item['title'];
          int itemId = item['id'];
          _specializationList.add(itemTitle);
          _specializationIds.add(itemId);
        }
        _specialization = _specializationList.join(",");
        debugPrint("_specialization in FPC1 is $_specialization");
      } else {
        _specialization = "";
      }
      debugPrint("_specialization in FPC2 is $_specialization");
      _yearsOfExperience = response.data['data']['experience_years'].toString();
      _rateAverage = double.parse(
          (response.data['data']['average_rate'] ?? 0.0).toString());
      _rateNum =
          double.parse((response.data['data']['rate_number'] ?? 0).toString());
      _patientsNum = response.data['data']['patients'] ?? 0;
      _followersNum = response.data['data']['followers_number'] ?? 0;
      _followingNum = response.data['data']['followings_number'] ?? 0;
      _gender = response.data['data']['gender'] ?? "UnKnow";
      _userTypeId = response.data['data']['user_type_id'] ?? 0;
      _taxNum = response.data['data']['tax_number'] ?? '';
      _taxImage = response.data['data']['tax_number_image'] ?? '';
      _logRecordNum = response.data['data']['log_record'] ?? '';
      _logRecordImage = response.data['data']['log_record_image'] ?? '';
      _countryTitle = response.data['data']['country_title'] ?? '';
      _stateTitle = response.data['data']['state_title'] ?? '';
      _cityTitle = response.data['data']['city_title'] ?? '';
      _address = response.data['data']['address'] ?? '';
      _administratorName = response.data['data']['adminstrator_name'] ?? '';
      _administratorPhone = response.data['data']['adminstrator_phone'] ?? '';
      _about = response.data['data']['about'] ?? '';
      _yearOfGraduation = response.data['data']['work_year'] ?? '';
      _graduationYear = response.data['data']['graduation_year'] ?? '';
      _universityTitle = response.data['data']['university_title'] ?? '';
      _universityId = response.data['data']['university_id'] ?? 0;
      _graduationDegree = response.data['data']['graduation_degree'] ?? 0;
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
