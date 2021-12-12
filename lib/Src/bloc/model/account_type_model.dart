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
    id: 0,
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
    id: 2,
    title: 'medical_Center'.tr,
    activeIcon: 'assets/image/RADClinic.png',
    disActiveIcon:  'assets/image/RDClinic.png',
  ),
  AccountTypeModel(
    id: 3,
    title: 'fresh_graduate'.tr,
    activeIcon: 'assets/image/RADFresh.png',
    disActiveIcon:  'assets/image/RDFresh.png',
  ),
];
