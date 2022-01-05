import 'package:dr_dent/Src/features/StaticFeature/bloc/models/question.dart';
import 'package:dr_dent/Src/features/StaticFeature/ui/widgets/question_item.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBars.appBarDefault(title: 'الأسألة الشائعة'),
          body: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding:  EdgeInsets.only(
              top: 16.h
            ),
            child: QuestionItem(
              question: Question(
                id: 0,
                expanded: true,
                answer: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة',
                question: 'كيف يمكنني التقديم لوظيفة معينة ؟'
              ),
            ),
          ),
          separatorBuilder: (context, index) => 16.0.ESH(),
          itemCount: 30,
          shrinkWrap: true,
      )
    );
  }
}
