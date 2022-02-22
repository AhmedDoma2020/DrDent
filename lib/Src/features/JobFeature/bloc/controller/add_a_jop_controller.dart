import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/add_a_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/row_jop_requirement_form.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddAJopOfferController extends GetxController {
  GetStorage box = GetStorage();
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? addressController;
  TextEditingController? scientificLevelIdController;
  TextEditingController? specializationController;
  TextEditingController? jobTypeController;
  TextEditingController? jobDescriptionController;
  List<int> _specializationIdSelected = [];
  List<int> get specializationIdSelected => _specializationIdSelected;
  set setSpecializationIdSelected(List<int> value) {
    _specializationIdSelected = value;
  }
  int? scientificLevelId;
  int? get servicesId => scientificLevelId;
  set setScientificLevelId(int value) {
    scientificLevelId = value;
  }

  double? _startSalary=1000;
  double? get startSalary => _startSalary;
  set setStartSalary(double value) {
    _startSalary = value;
  }

  double? _endSalary=5000;
  double? get endSalary => _endSalary;
  set setEndSalary(double value) {
    _endSalary = value;
  }

  List<String> _requirementsList=[];
  RequestStatus status = RequestStatus.initial;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AddAJopOfferRepository _addAJopOfferRepository =
  AddAJopOfferRepository();
  void submit() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      _requirementsList.clear();
      controllers.forEach((element) {
        debugPrint('my data is ${element.text}');
        _requirementsList.add(element.text);
      }
      );
      debugPrint('requirements List is $_requirementsList');
      setLoading();
      var response = await _addAJopOfferRepository.addAJopOffer(
        ownerName: nameController!.text,
        phone: phoneController!.text,
        address: addressController!.text,
        scientificLevel: scientificLevelId!,
        specializationId: _specializationIdSelected,
        startSalary: _startSalary!,
        endSalary: _endSalary!,
        jobType: jobTypeController!.text,
        description: jobDescriptionController!.text,
        requirements:_requirementsList,
      );
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
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
    scientificLevelIdController = TextEditingController();
    specializationController = TextEditingController();
    jobTypeController = TextEditingController();
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
  }

  @override
  void dispose() {
    nameController?.dispose();
    phoneController?.dispose();
    addressController?.dispose();
    scientificLevelIdController?.dispose();
    specializationController?.dispose();
    jobTypeController?.dispose();
    jobDescriptionController?.dispose();
    super.dispose();
  }


}
