import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/StaticFeature/bloc/models/question.dart';
import 'package:dr_dent/Src/features/StaticFeature/ui/widgets/question_item.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bloc/controllers/questions_controller.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionsController());
    return Scaffold(
        appBar: AppBars.appBarDefault(title: 'common_questions'),
        body: GetBuilder<QuestionsController>(
          builder: (_) {
            return
              _.status != RequestStatus.done?
                 Center(child: Loader(),):
              ListView.separated(
              itemBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16.h
                    ),
                    child: GestureDetector(
                      onTap: (){
                        _.expandQuestion(index);
                      },
                      child: QuestionItem(
                        question: _.questions[index],

                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => 0.0.ESH(),
              itemCount: _.questions.length,
              shrinkWrap: true,
            );
          },
        )
    );
  }
}
