import 'dart:ffi';

import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/model/job_request.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/repository/job_requests_repository.dart';
import 'package:dr_dent/Src/features/NotificationFeature/bloc/repository/notifications_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/services/dialogs.dart';
import '../models/notification_model.dart';


class NotificationsController extends GetxController{
  RequestStatus status = RequestStatus.initial;
  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;


  // ========== START FETCH DATA  ====================
  final NotificationsRepository _notificationsRepository = NotificationsRepository();
  Future<void> fetchNotifications()async{

      status = RequestStatus.loading;
      update();
    var response = await _notificationsRepository.fetchNotifications();
    if (response.statusCode == 200 && response.data["status"] == true) {
      debugPrint("request operation success");
      _notifications.clear();
      if(response.data['data']!=null){
        for (var item in response.data['data']) {
          _notifications.add(NotificationModel.fromJson(item));
        }
      }
      debugPrint("convert operation success");
      status = RequestStatus.done;
      update();
    }else{
      status = RequestStatus.done;
      update();
    }
  }
  // ================  END FETCH DATA  ====================



  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

}