import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_jop_request_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../ui/widgets/custom_snack_bar.dart';
import '../Repository/edit_jop_request_repo.dart';
import '../model/job_request.dart';
import 'job_request_controller.dart';

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
    update();
  }

  void setData() {
    nameController!.text = jobRequestModel!.ownerName!;
    phoneController!.text = jobRequestModel!.ownerPhone!;
    addressController!.text = jobRequestModel!.ownerAddress!;
    if(jobRequestModel!.specializations!.isNotEmpty){
      List<String> specializationsTitle=[];
      List<int> specializationsId=[];
      for(var item in jobRequestModel!.specializations!){
        specializationsTitle.add(item.title);
        specializationsId.add(item.id);
      }
      specializationController!.text = specializationsTitle.join(",");
      _specializationIdSelected = specializationsId;
    }
    setFutureCVImage = jobRequestModel!.cv!;
    update();
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddJopRequestRepository _addJopRequestRepository =
      AddJopRequestRepository();
  final EditJopRequestRepository _editJopRequestRepository =
  EditJopRequestRepository();
  final FetchJobRequestController _fetchJobRequestController = Get.find();
  void addJobRequest() async {
    if (globalKey.currentState!.validate()) {
      if(_cVImage !='' || _futureCVImage != ''){
        globalKey.currentState!.save();
        dynamic response ;
        if(isEdit){
          debugPrint("Is Edit");
          setLoading();
          response = await _editJopRequestRepository.editJopRequest(
            jobRequestId: jobRequestModel!.id!,
            ownerName: nameController!.text,
            phone: phoneController!.text,
            address: addressController!.text,
            specializationId: _specializationIdSelected,
            cV: _cVImage,
          );
          Get.back();
        }else{
          debugPrint("Is Not Edit");
          setLoading();
          response = await _addJopRequestRepository.addJopRequest(
            name: nameController!.text,
            phone: phoneController!.text,
            address: addressController!.text,
            specializationId: _specializationIdSelected,
            cV: _cVImage,
          );
          Get.back();
        }
        if (response.statusCode == 200 && response.data["status"] == true) {
          debugPrint("request operation success");
          _fetchJobRequestController.fetchJobRequests();
          Get.back();
          customSnackBar(title: response.data["message"]??"");
          debugPrint("convert operation success");
          status = RequestStatus.done;
          update();
        } else {
          status = RequestStatus.error;
          update();
        }
      }else{
        customSnackBar(title:"must_attach_your_CV".tr);
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
