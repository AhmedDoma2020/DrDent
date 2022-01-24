import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/constants/api_key.dart';
import 'package:dr_dent/Src/core/services/network_services.dart';
import 'package:dr_dent/Src/core/utils/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class SetOfferAndDiscountRepository with ApiKey {
  final NetworkService _networkService = NetworkService();

  Future<Response> setOfferAndDiscount({
    required String title,
    required String startDate,
    required String endDate,
    required String price,
    required String priceAfterOffer,
    required String offerInfo,
    required String bookingInfo,
    required String image,
    required List<int> serviceIds,
  }) async {
    Response response;
    debugPrint("startDate in repo $startDate");
    debugPrint("endDate in repo $endDate");

    try {
      response = await _networkService.post(
        url: uRLSetOfferAndDiscount,
        auth: true,
        body: {
          "title": title,
          "start_date": startDate,
          "end_date": endDate,
          "price": price,
          "price_after_offer": priceAfterOffer,
          "offer_info": offerInfo,
          "booking_info": bookingInfo,
          "image": image,
          "service_ids": serviceIds,
        },
      );
    } on SocketException {
      throw const SocketException('No Internet Connection');
    } on Exception {
      throw UnKnownException('there is unKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
