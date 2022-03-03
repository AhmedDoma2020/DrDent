import 'package:dr_dent/Src/bloc/model/store.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_company.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_offer.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_job_request.dart';
import 'package:dr_dent/Src/ui/widgets/Cards/card_product.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_row_view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../features/HomeFeature/bloc/controller/information_requets_controller.dart';
import '../Cards/card_person.dart';
import '/src/core/utils/extensions.dart';

class SliderCardPerson extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(InformationRequestsController());
    return GetBuilder<InformationRequestsController>(
      assignId: true,
      builder: (_) {
        return
          _.status != RequestStatus.done?
              0.0.ESH():
              _.requests.isEmpty?
                  0.0.ESH():
          Column(
          children: [
            TitleRowViewAll(
              titleSlider: 'طلبات الاستعلام', titleOnTap: ' ', onTap: () {},),
            12.0.ESH(),
            SizedBox(
              height: 90.h,
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.only(right: index == 0 ? 16.w : 0),
                      child: CardPerson(request:_.requests[index],onDelete: (){_.deleteInformationRequests(requestIndex: index);}),
                    ),
                separatorBuilder: (context, index) => 16.0.ESW(),
                itemCount: _.requests.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        );
      },
    );
  }
}
