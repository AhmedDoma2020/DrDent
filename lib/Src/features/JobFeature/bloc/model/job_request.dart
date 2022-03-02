


class
JobRequest {
  int? id;
  String? ownerName;
  String? ownerImage;
  String? ownerPhone;
  String? ownerAddress;
  List<Specializations>? specializations;
  String? specializationsTitle;
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
        this.specializationsTitle,
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
    if(map['specializations']!=null){
      specializations = List.from(map['specializations']).map((e)=>Specializations.fromJson(e)).toList();
      List<String> specializationTitleList=[];
      for(var item in specializations!){
        specializationTitleList.add(item.title);
      }
      specializationsTitle = specializationTitleList.join(',');
    }else{
      specializations = [];
    }
    cv = map['cv']??' ';
    gender = map['gender']??' ';
    graduatedYear = map['graduated_year']??' ';
    univeristy = map['univeristy']??' ';
    appreciation = map['appreciation']??' ';
  }

}

class Specializations {
  Specializations({
    required this.id,
    required this.title,
    required this.selected,
  });
  late final int id;
  late final String title;
  late final bool selected;

  Specializations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    return _data;
  }
}