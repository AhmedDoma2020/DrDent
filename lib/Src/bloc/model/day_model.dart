import 'package:dr_dent/Src/bloc/model/day_time_model.dart';

class DayModel{
  late final int id;
  late final String title;
  List<DayTimeModel>? times;
  late bool expanded;

  DayModel({required this.id,required this.title, this.times,this.expanded=false});

  DayModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    expanded = false;
  }


  void setTimes(Map<String , dynamic> map){
    times = [];
    if (map['times'] != null) {
       map['times'].forEach((v) {
        times!.add(DayTimeModel.fromJson(v));
      });
    }
  }
}

List<DayModel> dayExamples = [
  DayModel(
    id: 1,
    title: 'الاحد',
    expanded: false,
    times: dayTimeModelExamples,
  ),
  DayModel(
    id: 2,
    title: 'الاثنين',
    expanded: false,
    times: [],
  ),
  DayModel(
    id: 3,
    title: 'الثلاثاء',
    expanded: false,
    times: [],
  ),
  DayModel(
    id: 4,
    title: 'الاربعاء',
    expanded: false,
    times: dayTimeModelExamples,
  ),
];