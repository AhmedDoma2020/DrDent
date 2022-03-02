import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_jop_request_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Repository/edit_jop_request_repo.dart';
import '../model/job_request.dart';

class AddJopRequestController extends GetxController {
  final bool isEdit;
  final JobRequest? jobRequestModel;

  AddJopRequestController({this.isEdit = false, this.jobRequestModel});

  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? addressController;
  TextEditingController? specializationController;
  List<int> _specializationIdSelected = [];

  List<int> get specializationIdSelected => _specializationIdSelected;

  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }

  String _cVImage = '';
  String get cVImage => _cVImage;
  set setCVImage(String value) {
    _cVImage = value;
  }
  String _futureCVImage = '';
  String get futureCVImage => _futureCVImage;
  set setFutureCVImage(String value) {
    _futureCVImage = value;
  }

  void setData() {
    nameController!.text = jobRequestModel!.ownerName!;
    phoneController!.text = jobRequestModel!.ownerPhone!;
    addressController!.text = jobRequestModel!.ownerAddress!;
    addressController!.text = jobRequestModel!.specializations!.join(",");
    setFutureCVImage = jobRequestModel!.cv!;
    update();
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddJopRequestRepository _addJopRequestRepository =
      AddJopRequestRepository();
  final EditJopRequestRepository _editJopRequestRepository =
  EditJopRequestRepository();

  void addJobRequest() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      dynamic response ;
      if(isEdit){
        setLoading();
         response = await _editJopRequestRepository.editJopRequest(
          ownerName: nameController!.text,
          phone: phoneController!.text,
          address: addressController!.text,
          specializationId: _specializationIdSelected,
          cV: _cVImage,
        );
        Get.back();
      }else{
        setLoading();
         response = await _addJopRequestRepository.addJopRequest(
          ownerName: nameController!.text,
          phone: phoneController!.text,
          address: addressController!.text,
          specializationId: _specializationIdSelected,
          cV: _cVImage,
        );
        Get.back();
      }
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
        Get.back();
        debugPrint("convert operation success");
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
    specializationController = TextEditingController();
    nameController!.text = box.read('name') ?? "";
    phoneController!.text = box.read('phone') ?? "";
    addressController!.text = box.read('address') ?? "";
    _specializationIdSelected = [];
    if (isEdit) setData();
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    addressController?.dispose();
    specializationController?.dispose();
    super.dispose();
  }
}
