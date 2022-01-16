import 'package:get/get.dart';

class AccountTypeModel {
  int id;
  String title;
  String activeIcon;
  String disActiveIcon;

  AccountTypeModel(
      {this.id = 0,
      this.title = '',
      this.activeIcon = '',
      this.disActiveIcon = '',
      });
}

List<AccountTypeModel> accountTypeList = [
  AccountTypeModel(
    id: 3,
    title: 'doctor_'.tr,
    activeIcon: 'assets/image/RADoctor.png',
    disActiveIcon: 'assets/image/RDDoctor.png',
  ),
  AccountTypeModel(
    id: 1,
    title: 'medical_company'.tr,
    activeIcon: 'assets/image/RACompany.png',
    disActiveIcon: 'assets/image/RDCompany.png',
  ),
  AccountTypeModel(
    id: 4,
    title: 'medical_Center'.tr,
    activeIcon: 'assets/image/RADClinic.png',
    disActiveIcon:  'assets/image/RDClinic.png',
  ),
  AccountTypeModel(
    id: 7,
    title: 'fresh_graduate'.tr,
    activeIcon: 'assets/image/RADFresh.png',
    disActiveIcon:  'assets/image/RDFresh.png',
  ),
];

List<AccountTypeModel> medicalCompanyTypeList = [
  AccountTypeModel(
    id: 6,
    title: 'dental_lab'.tr,
    activeIcon: 'assets/image/RADClinic.png',
    disActiveIcon: 'assets/image/RDClinic.png',
  ),
  AccountTypeModel(
    id: 5,
    title: 'medical_company'.tr,
    activeIcon: 'assets/image/RACompany.png',
    disActiveIcon:  'assets/image/RDClinic.png',
  ),
];
