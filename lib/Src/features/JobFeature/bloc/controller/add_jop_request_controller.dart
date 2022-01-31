
import 'package:dr_dent/Src/core/utils/request_status.dart';
import '../../../ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Repo/enter_and_edit_personal_data_of_doctor_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_a_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_jop_request_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddJopRequestController extends GetxController {
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

  String _cVImage='';
  String get cVImage => _cVImage;
  set setCVImage(String value) {
    _cVImage = value;
  }

  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddJopRequestRepository _addJopRequestRepository =
  AddJopRequestRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
// setLoadingDialog();
      var response = await _addJopRequestRepository.addJopRequest(
        ownerName: nameController!.text,
        phone: phoneController!.text,
        address: addressController!.text,
        specializationId: _specializationIdSelected,
       cV: _cVImage,
      );
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");

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
    _specializationIdSelected = [];
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
