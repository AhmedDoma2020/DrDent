


class JobOffer {
  JobOffer({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.address,
    required this.startSalary,
    required this.endSalary,
    required this.description,
    required this.cityTitle,
    required this.cityId,
    required this.jobTypeId,
    required this.scientificlevelTitle,
    required this.scientificlevelId,
    required this.specializations,
    required this.requirements,
    required this.image,
  });
  late final int id;
  late final int userId;
  late final String name;
  late final String phone;
  late final String address;
  late final String startSalary;
  late final String endSalary;
  late final String description;
  late final String scientificlevelTitle;
  late final String cityTitle;
  late final int scientificlevelId;
  late final int cityId;
  late final int jobTypeId;
  late final List<Specializations> specializations;
  late final List<String> requirements;
  late final String image;

  JobOffer.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    userId = json['user_id']??0;
    name = json['name']??"";
    phone = json['phone']??"";
    address = json['address']??"";
    startSalary = json['start_salary']??"";
    endSalary = json['end_salary']??"";
    description = json['description']??"";
    scientificlevelTitle = json['scientificlevel']??"";
    scientificlevelId = json['scientific_level_id']??0;
    cityTitle = json['city_title']??"";
    cityId = json['city_id']??0;
    jobTypeId = json['job_type']??0;
    if(json['specializations']!=null){
      specializations = List.from(json['specializations']).map((e)=>Specializations.fromJson(e)).toList();
    }else{
      specializations = [];
    }
    if(json['requirements']!=null){
      List<String> requirementsLocal =[];
      for(var item in json['requirements']){
        requirementsLocal.add(item??'');
      }
      requirements  = requirementsLocal;
    }
    image = json['image'];
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

//
// class JobOffer {
//   int? id;
//   String? name;
//   String? image;
//   String? phone;
//   String? address;
//   String? startSalary;
//   String? endSalary;
//   String? description;
//   String? scientificlevel;
//   List<String>? requirements;
//   List<String>? specializations;
//
//
//   JobOffer(
//   {
//     this.id,
//     this.name,
//     this.image,
//     this.phone,
//     this.address,
//     this.specializations,
//     this.endSalary,
//     this.requirements,
//     this.startSalary,
//     this.description,
//     this.scientificlevel,
// });
//
//
//
//   JobOffer.fromJson(Map<String,dynamic> map){
//     id = map['id']??0;
//     name = map['name']??' ';
//     image = map['image']??' ';
//     phone = map['phone']??' ';
//     address = map['address']??' ';
//     startSalary= map['start_salary']??'0';
//     endSalary = map['end_salary']??'0';
//     description = map['description']??'';
//     scientificlevel = map['scientificlevel']??'';
//     requirements = map['requirements']!=null ? map['requirements'].cast<String>() : [];
//     specializations = map['specializations']!=null ? map['specializations'].cast<String>() : [];
//   }
// }