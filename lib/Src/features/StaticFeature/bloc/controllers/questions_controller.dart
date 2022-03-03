import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/delete_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/StaticFeature/bloc/models/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repositories/questions_repository.dart';

class QuestionsController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  List<Question> _questions = [];
  List<Question> get questions => _questions;


  // ========== START FETCH DATA  ====================
  final QuestionsRepository _questionsRepository = QuestionsRepository();

  Future<void> fetchQuestions()async{
      status = RequestStatus.loading;
      update();
    var response = await _questionsRepository.fetchQuestions();
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _questions.clear();
      if(response.data['data']!=null){
        for (var item in response.data['data']) {
          _questions.add(Question.fromJson(item));
        }
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



  void expandQuestion(int index){
    _questions[index].expanded=!_questions[index].expanded;
    update();
  }



  @override
  void onInit() {
    super.onInit();
    fetchQuestions();
  }


}