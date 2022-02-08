import 'dart:convert';
import 'dart:io';

import 'package:dr_dent/Src/bloc/model/item_of_share_model.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Repository/add_post_repo.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class AddPostController extends GetxController  {
  RequestStatus status = RequestStatus.initial;
  TextEditingController? contentController;

  List<ItemOfShareModel> _shareItemsDoctorList = [];
  List<ItemOfShareModel> get shareItemsDoctorList => _shareItemsDoctorList;

  List<int> _shareItemsIdsSelected = [];

  String _shareWithButtonTitle ="";
  String get shareWithButtonTitle => _shareWithButtonTitle;

  final AddPostRepository _addPostRepository =AddPostRepository();


  //  Future<void> addPost()async{
  //    debugPrint('contentController in add post is ${ contentController!.text}');
  //    debugPrint('img64 in add post is ${ img64!}');
  //    debugPrint('shareItemsIdsSelected in add post is $_shareItemsIdsSelected');
  //    setLoading();
  //   var response = await _addPostRepository.addPost(content: contentController!.text, images: img64!, tags: _shareItemsIdsSelected);
  //   Get.back();
  //   if(response.statusCode == 200 && response.data['message'] == true){
  //     debugPrint('response in add post is $response');
  //     customSnackBar(title: response.data["message"] ?? "Error");
  //     update();
  //   }else{
  //     debugPrint('response in add post is $response');
  //     customSnackBar(title: response.data["message"] ?? "Error");
  //     update();
  //   }
  // }


  File? image;
  void changeImageVal(val) {
    image = val;
    img64 = val;
    update();
  }
  String? img64;



  // to select how share with and set ids in list and set title in shareWithButton
  void changeIsSelected(index) {
    if (index == 0) {
      _shareItemsIdsSelected.clear();
      for (var item in _shareItemsDoctorList) {
        item.isSelected = false;
      }
      _shareItemsDoctorList[index].isSelected =
      !_shareItemsDoctorList[index].isSelected;
      if (_shareItemsDoctorList[index].isSelected == true) {
        _shareItemsIdsSelected = [1];
        _shareWithButtonTitle = _shareItemsDoctorList[index].title;
      } else {
        _shareItemsIdsSelected.clear();
        _shareWithButtonTitle = "";
      }
      debugPrint("_shareItemsIdsSelected is ${_shareItemsIdsSelected.reactive}");
    } else {
      _shareItemsDoctorList[index].isSelected =
      !_shareItemsDoctorList[index].isSelected;
      _shareItemsDoctorList[0].isSelected = false;
      _shareItemsIdsSelected.clear();
      for (var item in _shareItemsDoctorList) {
        if (item.isSelected == true) {
          _shareItemsIdsSelected.add(item.id);
        }
      }
      if(_shareItemsIdsSelected.length == 1 ){
        int lastSingleId = int.parse(_shareItemsIdsSelected[0].reactive.toString());
        debugPrint("single id is $lastSingleId");
        int lastSingleIndex = _shareItemsDoctorList.indexWhere((element) => element.id == lastSingleId);
        debugPrint("single index is $lastSingleIndex");
        _shareWithButtonTitle= _shareItemsDoctorList[lastSingleIndex].title;
      }else{
        _shareWithButtonTitle="custom_".tr;
      }
      debugPrint("_shareItemsIdsSelected is ${_shareItemsIdsSelected.reactive}");
    }
    update();
  }

  // to make image = null

  // to set image in post
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      update();
      final bytes = File(image.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      // widget.onTap(img64!);
    } on PlatformException catch (e) {
      debugPrint("field picked image $e");
    }
  }


  void submit() async {
    debugPrint("img64 $img64");
    debugPrint("contentController ${contentController!.text}");
    debugPrint("shareItemsIdsSelected $_shareItemsIdsSelected");
    if(img64 != null || contentController!.text.isNotEmpty){
      List<String> imageList = [];
      imageList.add(img64!);
      setLoading();
      var response = await  _addPostRepository.addPost(content: contentController!.text, images: imageList, tags: _shareItemsIdsSelected);
      Get.back();
      if (response.statusCode == 200 && response.data["status"] == true) {
        debugPrint("request operation success");
        debugPrint('response in add post is $response');
        Get.back();
        customSnackBar(title: response.data["message"]??"");
        debugPrint("convert operation success");
        status = RequestStatus.done;
        update();
      } else {
        debugPrint('response in add post is $response');
        status = RequestStatus.error;
        customSnackBar(title: response.data["message"]??"");
        update();
      }
    }else{
      customSnackBar(title: "must_attach_your_avatar".tr,);
      update();
    }
  }
bool isContentCEmpty= true;
  @override
  void onInit() {
    // TODO: implement onInit
    contentController = TextEditingController();
    contentController!.addListener((){
      if(contentController!.text.isEmpty){
        isContentCEmpty=true;
        update();
      }else{
        isContentCEmpty=false;
        update();
      }
    });
    _shareItemsDoctorList = shareItemsDoctorListModel;
    _shareItemsDoctorList[0].isSelected =true;
    _shareItemsIdsSelected = [1];
    _shareWithButtonTitle = _shareItemsDoctorList[0].title;
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    contentController?.dispose();

    super.dispose();
  }
}
