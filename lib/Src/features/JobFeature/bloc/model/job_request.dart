


class
JobRequest {
  int? id;
  String? ownerName;
  String? ownerImage;
  String? ownerPhone;
  String? ownerAddress;
  List<String>? specializations;
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
        this.specializations,
        this.cv,
        this.gender,
        this.graduatedYear,
        this.univeristy,
        this.appreciation
      });



  JobRequest.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    ownerName = map['name']??' ';
    ownerImage = map['image']??' ';
    ownerPhone = map['phone']??' ';
    ownerAddress = map['address']??' ';
    specializations = map['specializations']!=null ? map['specializations'].cast<String>():[];
    cv = map['cv']??' ';
    gender = map['gender']??' ';
    graduatedYear = map['graduated_year']??' ';
    univeristy = map['univeristy']??' ';
    appreciation = map['appreciation']??' ';
  }

}