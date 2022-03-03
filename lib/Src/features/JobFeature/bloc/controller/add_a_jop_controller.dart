import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_a_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/row_jop_requirement_form.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Repository/edit_a_jop_offer_repo.dart';
import '../model/job_offer.dart';
import 'job_offers_controller.dart';

class AddAJopOfferController extends GetxController {
  final JobOffer? jobOffer;
  final bool isEdit;
  AddAJopOfferController({this.jobOffer,this.isEdit=false}) ;
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? addressController;
  TextEditingController? cityController;
  TextEditingController? scientificLevelTitleController;
  TextEditingController? specializationController;
  TextEditingController? jobDescriptionController;
  List<int> _specializationIdSelected = [];
  List<int> get specializationIdSelected => _specializationIdSelected;
  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }
  int? _scientificLevelId;
  int? get scientificLevelId => _scientificLevelId;
  set setScientificLevelId(int value) {
    _scientificLevelId = value;
  }

  int _startSalary=1000;
  int get startSalary => _startSalary;
  set setStartSalary(int value) {
    _startSalary = value;
  }

  int _endSalary=5000;
  int get endSalary => _endSalary;
  set setEndSalary(int value) {
    _endSalary = value;
  }

  int _cityId = 0;
  int get cityId => _cityId;
  set setCityId(int value) {
    _cityId = value;
    update();
  }

  int _jobTypeId = 0;
  int get jobTypeId => _jobTypeId;
  set setJobTypeId(int value) {
    _jobTypeId = value;
    update();
  }


  void setData(){
    nameController!.text = jobOffer!.name;
    phoneController!.text = jobOffer!.phone;
    addressController!.text = jobOffer!.address;
    scientificLevelTitleController!.text = jobOffer!.scientificlevelTitle;
    setScientificLevelId = jobOffer!.scientificlevelId;
    if(jobOffer!.specializations.isNotEmpty){
      List<String> specializationsTitle=[];
      List<int> specializationsId=[];
      for(var item in jobOffer!.specializations){
        specializationsTitle.add(item.title);
        specializationsId.add(item.id);
      }
      specializationController!.text = specializationsTitle.join(",");
      _specializationIdSelected = specializationsId;
    }
    _startSalary =int.parse(jobOffer!.startSalary.toString());
    _endSalary =int.parse(jobOffer!.endSalary.toString());
    jobDescriptionController!.text = jobOffer!.description;
    controllers = jobOffer!.requirements.cast<TextEditingController>();
    setCityId = jobOffer!.cityId;
    cityController!.text = jobOffer!.cityTitle;
    setJobTypeId = jobOffer!.jobTypeId;
    update();
}
  List<String> _requirementsList=[];
  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddAJopOfferRepository _addAJopOfferRepository =
  AddAJopOfferRepository();
  final EditAJopOfferRepository _editAJopOfferRepository =
  EditAJopOfferRepository();
  final JobOffersController _jobOffersController = Get.find();

  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      dynamic response;
      if(isEdit){
        debugPrint('submit in Edit');
        _requirementsList.clear();
        if(jobOffer!.requirements.isNotEmpty){
          _requirementsList =  jobOffer!.requirements;
        }
        debugPrint('requirements List is $_requirementsList');
        setLoading();
         response = await _editAJopOfferRepository.editAJopOffer(
           jobOfferId: jobOffer!.id,
          ownerName: nameController!.text,
          phone: phoneController!.text,
          address: addressController!.text,
          scientificLevel: _scientificLevelId!,
          cityId: _cityId,
          specializationId: _specializationIdSelected,
          startSalary: _startSalary,
          endSalary: _endSalary,
          jobType: _jobTypeId,
          description: jobDescriptionController!.text,
          requirements:_requirementsList,
        );
         Get.back();
      }else{
        debugPrint('submit in set as first');
        _requirementsList.clear();
        controllers.forEach((element) {
          debugPrint('my data is ${element.text}');
          if(element.text.isNotEmpty){
            _requirementsList.add(element.text);
          }
        }
        );
        debugPrint('requirements List is $_requirementsList');
        setLoading();
         response = await _addAJopOfferRepository.addAJopOffer(
          ownerName: nameController!.text,
          phone: phoneController!.text,
          address: addressController!.text,
          scientificLevel: _scientificLevelId!,
          specializationId: _specializationIdSelected,
          cityId: _cityId,
          startSalary: _startSalary,
          endSalary: _endSalary,
          jobType:_jobTypeId,
          description: jobDescriptionController!.text,
          requirements:_requirementsList,
        );
        Get.back();
      }
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
        _jobOffersController.fetchJobOffers();
        Get.back();
        customSnackBar(title: response.data["message"] ?? "Error");
        debugPrint("convert operation success");
        status = RequestStatus.done;
        update();
      } else {
        customSnackBar(title: response.data["message"] ?? "Error");
        status = RequestStatus.error;
        update();
      }
    }
  }




  List<Widget> showWidget=[];
  List<TextEditingController> controllers=[];

  void addNewInstance(){
    TextEditingController exmpleController = TextEditingController();
    controllers.add(exmpleController);
    int reloadedIndex = showWidget.length;
    showWidget.add(
        RowJopRequirementForm(
          controller: controllers[reloadedIndex],
          onChangeTF: (val){
            // if(sendReq.length > index){
            //   sendReq.removeAt(index);
            //   sendReq.insert(index, val);
            // }else{
            //   sendReq.add(val);
            // }
          },
          numOfList:showWidget.length,
          index :  showWidget.length,
          text: showWidget.length.toString(),
          onTap: (){
            // if((index + 1) == itemCount){
            //   if(sendReq.length == itemCount){
            //     setState(() {
            //       itemCount++;
            //     });
            //   }
            // }else{
            //
            // }
            // print('hhhhhhhhhhhhhhhhhhhhhhhhh ${reloadedIndex}');
            deleteInstance(id: reloadedIndex);
          },
        ));
    update();
  }
  void deleteInstance({required int id}){
    debugPrint('hhheeeeeeeeehhhh $id');
    showWidget.removeAt(id);
    controllers.removeAt(id);
    renewInstances();
    update();
  }
  void renewInstances(){
    int reloadedLength = showWidget.length;
    showWidget.clear();
    for(int i = 0; i< reloadedLength ; i++){
      showWidget.add(RowJopRequirementForm(
        controller: controllers[i],
        onChangeTF: (val){
          // if(sendReq.length > index){
          //   sendReq.removeAt(index);
          //   sendReq.insert(index, val);
          // }else{
          //   sendReq.add(val);
          // }
        },
        numOfList:showWidget.length,
        index :  i,
        text: showWidget.length.toString(),
        onTap: (){
          // if((index + 1) == itemCount){
          //   if(sendReq.length == itemCount){
          //     setState(() {
          //       itemCount++;
          //     });
          //   }
          // }else{
          //
          // }
          // print('hhhhhhhhhhhhhhhhhhhhhhhhh ${reloadedIndex}');
          if(i==0){
            addNewInstance();
          }else{
            deleteInstance(id: i);
          }
        },
      ));
    }
    update();
  }


  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    scientificLevelTitleController = TextEditingController();
    specializationController = TextEditingController();
    jobDescriptionController = TextEditingController();
    _specializationIdSelected = [];

    TextEditingController exmpleController = TextEditingController();

    controllers.add(exmpleController);

    showWidget.add(
        RowJopRequirementForm(
          controller: controllers[0],
          onChangeTF: (val){
            // if(sendReq.length > index){
            //   sendReq.removeAt(index);
            //   sendReq.insert(index, val);
            // }else{
            //   sendReq.add(val);
            // }
          },

          // numOfList:AddAJopOfferController().showWidget.length,
          numOfList: showWidget.length,
          index : 0,
          text: "Job_requirements".tr,
          onTap: (){
            // if((index + 1) == itemCount){
            //   if(sendReq.length == itemCount){
            //     setState(() {
            //       itemCount++;
            //     });
            //   }
            // }else{
            //
            // }
            addNewInstance();
          },)
    );
    if(isEdit)setData();
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    addressController?.dispose();
    cityController?.dispose();
    scientificLevelTitleController?.dispose();
    specializationController?.dispose();
    jobDescriptionController?.dispose();
    super.dispose();
  }


}
