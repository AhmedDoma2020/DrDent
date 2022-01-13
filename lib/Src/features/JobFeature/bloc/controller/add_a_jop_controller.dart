import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/repository/enter_and_edit_my_personal_data_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_a_jop_offer_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddAJopOfferController extends GetxController {
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? addressController;
  TextEditingController? degreeController;
  TextEditingController? specializationController;
  TextEditingController? jobTypeController;
  TextEditingController? jobDescriptionController;
  List<int> _specializationIdSelected = [];
  List<int> get specializationIdSelected => _specializationIdSelected;
  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }
  int? _servicesId;
  int? get servicesId => _servicesId;
  set setServicesId(int value) {
    _servicesId = value;
  }

  double? _startSalary;
  double? get startSalary => _startSalary;
  set setStartSalary(double value) {
    _startSalary = value;
  }

  double? _endSalary;
  double? get endSalary => _endSalary;
  set setEndSalary(double value) {
    _endSalary = value;
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddAJopOfferRepository _addAJopOfferRepository =
      AddAJopOfferRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
// setLoadingDialog();
        var response = await _addAJopOfferRepository.addAJopOffer(
          ownerName: nameController!.text,
          phone: phoneController!.text,
          address: addressController!.text,
          scientificLevel: degreeController!.text,
          specializationId: _specializationIdSelected,
          startSalary: _startSalary!,
          endSalary: _endSalary!,
          jobType: jobTypeController!.text,
          description: jobDescriptionController!.text,
          requirements: [],
        );
        if (response.statusCode == 200 && response.data["status"] == true) {
          print("request operation success");

          print("convert operation success");
          status = RequestStatus.done;
          update();
        } else {
          status = RequestStatus.error;
          update();
        }

    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    degreeController = TextEditingController();
    specializationController = TextEditingController();
    jobTypeController = TextEditingController();
    jobDescriptionController = TextEditingController();
    _specializationIdSelected = [];
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    addressController?.dispose();
    degreeController?.dispose();
    specializationController?.dispose();
    jobTypeController?.dispose();
    jobDescriptionController?.dispose();
    super.dispose();
  }


}
