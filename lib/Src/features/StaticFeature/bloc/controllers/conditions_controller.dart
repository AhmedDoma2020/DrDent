import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/delete_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/StaticFeature/bloc/models/question.dart';
import 'package:dr_dent/Src/features/StaticFeature/bloc/repositories/conditions_repository.dart';
import 'package:dr_dent/Src/features/StaticFeature/bloc/repositories/privace_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repositories/questions_repository.dart';

class ConditionsController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  String content = '';


  // ========== START FETCH DATA  ====================
  final ConditionsRepository _conditionsRepository = ConditionsRepository();

  Future<void> fetchConditions()async{
      status = RequestStatus.loading;
      update();
    var response = await _conditionsRepository.fetchConditions();
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      if(response.data['data']!=null){
        content = response.data['data']['text'];
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.error;
      update();
    }
  }
  // ================  END FETCH DATA  ====================





  @override
  void onInit() {
    super.onInit();
    fetchConditions();
  }


}