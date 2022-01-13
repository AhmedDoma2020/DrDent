
class DayTimeModel {
  DayTimeModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.numberOfEmergencyVisits,
  });

  late final int id;
  late final String startTime;
  late final String endTime;
  late final String numberOfEmergencyVisits;


  DayTimeModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    startTime = json['start_time']??' ';
    endTime = json['end_time']??' ';
    numberOfEmergencyVisits = json['emergency_bookings']!= null ?json['emergency_bookings'].toString() : '0';
  }

}

List<DayTimeModel> dayTimeModelExamples = [
  DayTimeModel(
    id: 1,
    endTime: '12:00',
    startTime: '12:00',
    numberOfEmergencyVisits: '0'
  ),
  DayTimeModel(
      id: 2,
      endTime: '12:00',
      startTime: '12:00',
      numberOfEmergencyVisits: '0'
  ),
  DayTimeModel(
      id: 3,
      endTime: '12:00',
      startTime: '12:00',
      numberOfEmergencyVisits: '0'
  ),
];