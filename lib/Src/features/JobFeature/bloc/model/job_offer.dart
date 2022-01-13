


class JobOffer {
  int? id;
  String? ownerName;
  String? ownerImage;
  String? ownerPhone;
  String? ownerAddress;
  String? ownerDescription;
  String? startPrice;
  String? endPrice;
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
    this.startPrice
});



  JobOffer.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    ownerName = map['owner_name']??' ';
    ownerImage = map['owner_image']??' ';
    ownerPhone = map['owner_phone']??' ';
    ownerAddress = map['owner_address']??' ';
    startPrice= map['start_price']??'0';
    endPrice = map['end_price']??'0';
    requirments = map['requirments']!=null ? map['requirments'].cast<String>() : [];
    specializations = map['specializations']!=null ? map['specializations'].cast<String>() : [];
  }
}