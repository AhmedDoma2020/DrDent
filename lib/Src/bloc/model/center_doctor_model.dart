class CenterDoctorModel {
  CenterDoctorModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.specialization,
    required this.price,
    required this.doctorInfo,
    required this.dates,
  });

  late final int id;
  late final String name;
  late final String phone;
  late final String image;
  late final String price;
  late final String doctorInfo;
  late final List<String> specialization;
  late final List<DateModel> dates;

  CenterDoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    image = json['image'];
    specialization = json['specialization'];
    price = json['price'];
    doctorInfo = json['doctor_info'];
    dates = json['dates'];
  }
}

class DateModel {
  late final String dayTitle;
  late final List<TimeModel> times;

  DateModel({
    required this.dayTitle,
    required this.times,
  });

  DateModel.fromJson(Map<String, dynamic> json) {
    dayTitle = json['dayTitle'];
    times = json['times'];
  }
}

class TimeModel {
  late final int id;
  late final String start;
  late final String end;
  late final String emergencyBookings;

  TimeModel({
    required this.id,
    required this.start,
    required this.end,
    required this.emergencyBookings,
  });

  TimeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    end = json['end'];
    emergencyBookings = json['emergencyBookings'];
  }
}

List<CenterDoctorModel> centerDoctorExample = [
  CenterDoctorModel(
    id: 1,
    name: "Eman Salah",
    phone: "01112342916",
    price: "15000",
    image:
        "https://images.pexels.com/photos/4167541/pexels-photo-4167541.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    doctorInfo:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة ",
    specialization: [
      "aaaaa",
      "xxxxx",
      "ccccc",
      "ddddd",
    ],
    dates: [
      DateModel(
        dayTitle: "ahmed",
        times: [
          TimeModel(
            id: 1,
            start: "2:15",
            end: "4:30",
            emergencyBookings: '111',
          ),
          TimeModel(
            id: 2,
            start: "2:22",
            end: "4:44",
            emergencyBookings: '222',
          ),
        ],
      ),
      DateModel(
        dayTitle: "doma",
        times: [
          TimeModel(
            id: 1,
            start: "3:33",
            end: "5:55",
            emergencyBookings: '333',
          ),
        ],
      ),
    ],
  ),
  CenterDoctorModel(
    id: 2,
    name: "Emay Sala",
    phone: "01112342916",
    price: "15000",
    image:
        "https://images.pexels.com/photos/4167541/pexels-photo-4167541.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    doctorInfo:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة ",
    specialization: [
      "aaaaa",
      "xxxxx",
      "ccccc",
      "aaaaa",
      "xxxxx",
      "aaaaa",
      "ddddd",
      "xxxxx",
    ],
    dates: [
      DateModel(
        dayTitle: "ccccc",
        times: [
          TimeModel(
            id: 1,
            start: "2:15",
            end: "4:30",
            emergencyBookings:'8',
          ),
          TimeModel(
            id: 1,
            start: "3:15",
            end: "4:30",
            emergencyBookings: '5',
          ),
          TimeModel(
            id: 1,
            start: "4:15",
            end: "4:30",
            emergencyBookings: '2',
          ),
          TimeModel(
            id: 1,
            start: "5:15",
            end: "4:30",
            emergencyBookings: '9',)
        ],
      ),
      DateModel(
        dayTitle: "ddddd",
        times: [
          TimeModel(
            id: 1,
            start: "2:15",
            end: "4:30",
            emergencyBookings: "8",
          ),
          TimeModel(
            id: 1,
            start: "3:15",
            end: "4:30",
            emergencyBookings: "9",
          ),
          TimeModel(
            id: 1,
            start: "4:15",
            end: "4:30",
            emergencyBookings: "10",
          ),
          TimeModel(
            id: 1,
            start: "5:15",
            end: "4:30",
            emergencyBookings: "11",
          ),
        ],
      ),
    ],
  ),
  CenterDoctorModel(
    id: 2,
    name: "Emay Sala",
    phone: "01112342916",
    price: "15000",
    image:
    "https://images.pexels.com/photos/4167541/pexels-photo-4167541.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    doctorInfo:
    "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة ",
    specialization: [
      "aaaaa",
      "xxxxx",
      "ccccc",
      "aaaaa",
      "xxxxx",
      "aaaaa",
      "ddddd",
      "xxxxx",
    ],
    dates: [
      DateModel(
        dayTitle: "ccccc",
        times: [
          TimeModel(
            id: 1,
            start: "2:15",
            end: "4:30",
            emergencyBookings:'8',
          ),
          TimeModel(
            id: 1,
            start: "3:15",
            end: "4:30",
            emergencyBookings: '5',
          ),
          TimeModel(
            id: 1,
            start: "4:15",
            end: "4:30",
            emergencyBookings: '2',
          ),
          TimeModel(
            id: 1,
            start: "5:15",
            end: "4:30",
            emergencyBookings: '9',)
        ],
      ),
      DateModel(
        dayTitle: "ddddd",
        times: [
          TimeModel(
            id: 1,
            start: "2:15",
            end: "4:30",
            emergencyBookings: "8",
          ),
          TimeModel(
            id: 1,
            start: "3:15",
            end: "4:30",
            emergencyBookings: "9",
          ),
          TimeModel(
            id: 1,
            start: "4:15",
            end: "4:30",
            emergencyBookings: "10",
          ),
          TimeModel(
            id: 1,
            start: "5:15",
            end: "4:30",
            emergencyBookings: "11",
          ),
        ],
      ),
    ],
  ),
  CenterDoctorModel(
    id: 1,
    name: "Emoo Salah",
    phone: "01112342916",
    price: "15000",
    image:
        "https://images.pexels.com/photos/4167541/pexels-photo-4167541.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    doctorInfo:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة ",
    specialization: [
      "aaaaa",
      "xxxxx",
      "ccccc",
      "ddddd",
    ],
    dates: [
      DateModel(
        dayTitle: "fffff",
        times: [
          TimeModel(
            id: 1,
            start: "2:15",
            end: "4:30",
            emergencyBookings: "8",
          ),
        ],
      )
    ],
  ),
];
