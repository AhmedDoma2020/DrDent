import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyCertificationFeature/Bloc/Repo/add_doctor_certification_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

import 'fetch_doctor_certification_controller.dart';


class AddDoctorCertificationController extends GetxController {
  final List<String> _certificationList=[];
  List<String> get certificationList => _certificationList;


  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFileList = [];

  List<XFile> get imageFileList => _imageFileList;

  FetchDoctorCertificationController _fetchDoctorCertificationController = Get.put(FetchDoctorCertificationController());

  Future getImages() async {
    final imageFileList = (await _picker.pickMultiImage())!;
     _imageFileList = imageFileList;
    for (var item in imageFileList){
      final bytes = File(item.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      _certificationList.add(img64);
    }
    update();
    setCertification();
  }


  final AddDoctorCertificationRepo _addDoctorCertificationRepo = AddDoctorCertificationRepo();


  Future<void> setCertification() async {
    if(_certificationList.isNotEmpty){
      setLoading();
      var response = await _addDoctorCertificationRepo.addDoctorCertification(
          certificationImages: _certificationList);
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        _fetchDoctorCertificationController.fetchCertification();
        customSnackBar(title: response.data["message"]??"");
      }else{
        customSnackBar(title: response.data["message"]??"");
      }
      update();
    }
  }

}
