class Visit{
  late int id;
  late String patientName;
  late String patientImage;
  late int patientId;
  late String patientPhone;
  late String patientAddress;
  late List<String>? servicesTitle;
  late String paymentMethod;
  late String patientNotes;
  late List<String>? patientFiles;
  late int doctorId;
  late String doctorName;
  late String? doctorImage;
  late String doctorAddress;
  late String doctorPhone;
  late int visitStatus;
  late int visitType;

  Visit(
  {
    required this.id,
    required this.patientName,
    this.patientImage=' ',
    required this.patientId,
    required this.patientPhone,
    this.patientAddress=' ',
    this.servicesTitle,
    required this.paymentMethod,
    this.patientNotes=' ',
    this.patientFiles,
    required this.doctorId,
    required this.doctorName,
    this.doctorImage,
    required this.doctorAddress,
    required this.visitStatus,
    required this.visitType,
    required this.doctorPhone
});

  Visit.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    patientName = map['patient_name']??'';
    patientImage = map['patient_image']??'';
    patientId = map['patient_id']??0;
    patientPhone = map['patient_phone']??'';
    patientAddress = map['patient_address']??'';
    paymentMethod = map['payment_method']??'';
    patientNotes = map['patient_notes']??'';
    doctorId = map['doctor_id']??0;
    doctorName = map['doctor_name']??'';
    doctorImage = map['doctor_image']??'';
    doctorPhone = map['doctor_phone']??'';
    doctorAddress = map['doctor_address']??'';
    visitStatus = map['visit_status']??0;
    visitType = map['visit_type']??0;
    setServicesTitles(map);
    setFiles(map);
  }
  void setServicesTitles(Map<String, dynamic> map){
    this.servicesTitle = [];
    if (map['services_titles'] != null) {
      map['services_titles'].forEach((v) {
        servicesTitle!.add(v);
      });
    }
  }

  void setFiles(Map<String, dynamic> map){
    this.patientFiles = [];
    if (map['patient_files'] != null) {
      map['patient_files'].forEach((v) {
        patientFiles!.add(v);
      });
    }
  }

}


List<Visit> visitsExamples = [
  Visit(
    id: 1,
    paymentMethod: 'كاش',
    doctorAddress: 'العنوان الفلاني',
    doctorId: 1,
    doctorName: 'احمد فتحي',
    doctorPhone: '01212648022',
    patientId: 1,
    patientName: 'احمد دومة',
    patientPhone: '0121212121212',
    visitStatus: 1,
    visitType: 1,
    doctorImage: '',
    patientAddress: 'عنوان تاني',
    patientFiles:[],
    patientImage: '',
    patientNotes: '',
    servicesTitle: []
      ),
  Visit(
      id: 1,
      paymentMethod: 'كاش',
      doctorAddress: 'العنوان الفلاني',
      doctorId: 1,
      doctorName: 'احمد فتحي',
      doctorPhone: '01212648022',
      patientId: 1,
      patientName: 'احمد دومة',
      patientPhone: '0121212121212',
      visitStatus: 1,
      visitType: 1,
      doctorImage: '',
      patientAddress: 'عنوان تاني',
      patientFiles:[],
      patientImage: '',
      patientNotes: '',
      servicesTitle: []
  ),
  Visit(
      id: 1,
      paymentMethod: 'كاش',
      doctorAddress: 'العنوان الفلاني',
      doctorId: 1,
      doctorName: 'احمد فتحي',
      doctorPhone: '01212648022',
      patientId: 1,
      patientName: 'احمد دومة',
      patientPhone: '0121212121212',
      visitStatus: 1,
      visitType: 1,
      doctorImage: '',
      patientAddress: 'عنوان تاني',
      patientFiles:[],
      patientImage: '',
      patientNotes: '',
      servicesTitle: []
  ),
  Visit(
      id: 1,
      paymentMethod: 'كاش',
      doctorAddress: 'العنوان الفلاني',
      doctorId: 1,
      doctorName: 'احمد فتحي',
      doctorPhone: '01212648022',
      patientId: 1,
      patientName: 'احمد دومة',
      patientPhone: '0121212121212',
      visitStatus: 1,
      visitType: 1,
      doctorImage: '',
      patientAddress: 'عنوان تاني',
      patientFiles:[],
      patientImage: '',
      patientNotes: '',
      servicesTitle: []
  ),
  Visit(
      id: 1,
      paymentMethod: 'كاش',
      doctorAddress: 'العنوان الفلاني',
      doctorId: 1,
      doctorName: 'احمد فتحي',
      doctorPhone: '01212648022',
      patientId: 1,
      patientName: 'احمد دومة',
      patientPhone: '0121212121212',
      visitStatus: 1,
      visitType: 1,
      doctorImage: '',
      patientAddress: 'عنوان تاني',
      patientFiles:[],
      patientImage: '',
      patientNotes: '',
      servicesTitle: []
  ),
];