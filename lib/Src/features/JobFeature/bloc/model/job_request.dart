


class JobRequest {
  int? id;
  String? ownerName;
  String? ownerImage;
  String? ownerPhone;
  String? ownerAddress;
  String? specialization;
  String? cv;
  String? gender;
  String? graduatedYear;
  String? univeristy;
  String? appreciation;

  JobRequest(
      {
        this.id,
        this.ownerName,
        this.ownerImage,
        this.ownerPhone,
        this.ownerAddress,
        this.specialization,
        this.cv,
        this.gender,
        this.graduatedYear,
        this.univeristy,
        this.appreciation
      });



  JobRequest.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    ownerName = map['owner_name']??' ';
    ownerImage = map['owner_image']??' ';
    ownerPhone = map['owner_phone']??' ';
    ownerAddress = map['owner_address']??' ';
    specialization = map['specialization']??' ';
    cv = map['cv']??' ';
    gender = map['gender']??' ';
    graduatedYear = map['graduated_year']??' ';
    univeristy = map['univeristy']??' ';
    appreciation = map['appreciation']??' ';
  }

}