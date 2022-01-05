import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/lists/list_job_offer.dart';
import 'package:flutter/material.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'قائمة المحفوظات'),
      body: ListJobOffers(
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
