import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/user_profile_model.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Ui/Widget/row_my_insurance_form.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';


class ListOfDoctorInsuranceCompany extends StatelessWidget {
  final List<InsuranceModel> insurances;

  const ListOfDoctorInsuranceCompany({
    required this.insurances,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'insurance_companies',fontW: FW.semicond,),
        SizedBox(
          child:  ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => RowMyInsuranceForm(
              insurance: insurances[index],
              onDeleteTap: () {},
              isDelete: false,
            ),
            separatorBuilder: (context, index) => 16.0.ESH(),
            itemCount: insurances.length,
          ),
        ),
      ],
    );
  }
}
