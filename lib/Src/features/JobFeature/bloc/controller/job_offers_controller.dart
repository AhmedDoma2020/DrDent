import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/Repository/delete_jop_offer_repo.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_offer.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_offers_repository.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JobOffersController extends GetxController{
  RequestStatus status = RequestStatus.initial;

  List<JobOffer> _jobOffers = [];
  List<JobOffer> get jobOffers => _jobOffers;
  List<JobOffer> _myJobOffers = [];
  List<JobOffer> get myJobOffers => _myJobOffers;

  // ========== START FETCH DATA  ====================
  final JobOffersRepository _jobOffersRepository = JobOffersRepository();

  Future<void> fetchJobOffers({VoidCallback? onSuccess , bool forceLoading=true,int? cityId})async{
    if(forceLoading){
      status = RequestStatus.loading;
      update();
    }
    var response = await _jobOffersRepository.fetchJobOffers(cityId:cityId??null);
    status = RequestStatus.done;
    update();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _jobOffers.clear();
      _myJobOffers.clear();
      if(response.data['data']!=null){
        for (var item in response.data['data']) {
          _jobOffers.add(JobOffer.fromJson(item));
        }
      }
      if(response.data['my_job_offers']!=null){
        for (var item in response.data['my_job_offers']) {
          _myJobOffers.add(JobOffer.fromJson(item));
        }
      }
      debugPrint("convert operation success");
      if(onSuccess!=null){
        onSuccess();
      }
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.error;
      update();
    }
  }
  // ================  END FETCH DATA  ====================




  // ========== START DELETE DATA  ====================
  final DeleteJopOfferRepository _deleteJopOfferRepository = DeleteJopOfferRepository();
  Future<void> deleteJobOffers({required int id})async{
    setLoading();
    var response = await _deleteJopOfferRepository.deleteJopOffer(id: id);
    if (response.statusCode == 200 && response.data["status"] == true) {
      fetchJobOffers(onSuccess: (){Get.back();},forceLoading: false);
    }else{
    Get.back();
    }
  }
  // ================  END DELETE DATA  ====================




  @override
  void onInit() {
    super.onInit();
    fetchJobOffers();
  }


}