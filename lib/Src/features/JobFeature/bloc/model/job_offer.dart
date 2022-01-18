


class JobOffer {
  int? id;
  String? ownerName;
  String? ownerImage;
  String? ownerPhone;
  String? ownerAddress;
  String? ownerDescription;
  String? startPrice;
  String? endPrice;
  String? description;
  String? scientificLevel;
  List<String>? requirments;
  List<String>? specializations;


  JobOffer(
  {
    this.id,
    this.ownerName,
    this.ownerImage,
    this.ownerPhone,
    this.ownerAddress,
    this.ownerDescription,
    this.specializations,
    this.endPrice,
    this.requirments,
    this.startPrice,
    this.description,
    this.scientificLevel,
});



  JobOffer.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    ownerName = map['name']??' ';
    ownerImage = map['owner_image']??' ';
    ownerPhone = map['phone']??' ';
    ownerAddress = map['address']??' ';
    startPrice= map['start_salary']??'0';
    endPrice = map['end_salary']??'0';
    description = map['description']??'';
    scientificLevel = map['scientificlevel']??'';
    requirments = map['requirements']!=null ? map['requirements'].cast<String>() : [];
    specializations = map['specializations']!=null ? map['specializations'].cast<String>() : [];
  }
}