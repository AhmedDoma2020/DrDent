

import 'insurance_model.dart';

class UserProfileModel {
  UserProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.followingsNumber,
    required this.followersNumber,
    required this.image,
    required this.cover,
    required this.rateNumber,
    required this.averageRate,
    required this.specializationsResource,
    required this.specializationsTitle,
    required this.experienceYears,
    required this.patients,
    required this.gender,
    required this.scientificlevel,
    required this.userTypeId,
    required this.taxNumber,
    required this.taxNumberImage,
    required this.logRecord,
    required this.logRecordImage,
    required this.workLisence,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.address,
    required this.lat,
    required this.lon,
    required this.countryTitle,
    required this.stateTitle,
    required this.cityTitle,
    required this.adminstratorName,
    required this.adminstratorPhone,
    required this.about,
    required this.workYear,
    required this.graduationYear,
    required this.universityId,
    required this.universityTitle,
    required this.graduationDegree,
    required this.cv,
    required this.certificates,
    required this.waitingTime,
    required this.price,
    required this.workAddress,
    required this.insurances,
    required this.isFollow,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final int followingsNumber;
  late final int followersNumber;
  late final String image;
  late final String cover;
  late final int rateNumber;
  late final int averageRate;
  late final List<Specializations> specializationsResource;
  late final String specializationsTitle;
  late final String experienceYears;
  late final int patients;
  late final String gender;
  late final Scientificlevel scientificlevel;
  late final int userTypeId;
  late final String taxNumber;
  late final String taxNumberImage;
  late final String logRecord;
  late final String logRecordImage;
  late final String workLisence;
  late final int countryId;
  late final int stateId;
  late final int cityId;
  late final String address;
  late final double lat;
  late final double lon;
  late final String countryTitle;
  late final String stateTitle;
  late final String cityTitle;
  late final String adminstratorName;
  late final String adminstratorPhone;
  late final String about;
  late final String workYear;
  late final String graduationYear;
  late final int universityId;
  late final String universityTitle;
  late final String graduationDegree;
  late final String cv;
  late final List<String> certificates;
  late final int waitingTime;
  late final int price;
  late final String workAddress;
  late final List<InsuranceModel> insurances;
  late final int isFollow;

  UserProfileModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
    phone = json['phone']??"";
    followingsNumber = json['followings_number']??0;
    followersNumber = json['followers_number']??0;
    image = json['image']??"";
    cover = json['cover']??"";
    rateNumber = json['rate_number']??0;
    averageRate = json['average_rate']??0;
    if(json['specializations']!=null){
      specializationsResource = List.from(json['specializations']).map((e)=>Specializations.fromJson(e)).toList();
      List<String> _specializationsListOfTitle=[];
      for(var item in specializationsResource){
        _specializationsListOfTitle.add(item.title);
      }
      specializationsTitle = _specializationsListOfTitle.join(' , ');
    }else{
      specializationsResource =[];
      specializationsTitle = '';
    }
    if(json['experience_years']!=null){
      experienceYears = json['experience_years'].toString();
    }else{
      experienceYears='';
    }
    patients = json['patients']??0;
    gender = json['gender']??0;
    if(json['scientificlevel']!=null && json['scientificlevel']!=""){
      scientificlevel = Scientificlevel.fromJson(json['scientificlevel']);
    }
    userTypeId = json['user_type_id']??3;
    taxNumber = json['tax_number']??"";
    taxNumberImage = json['tax_number_image']??"";
    logRecord = json['log_record']??"";
    logRecordImage = json['log_record_image']??"";
    workLisence = json['work_lisence']??"";
    countryId = json['country_id']??0;
    stateId = json['state_id']??0;
    cityId = json['city_id']??0;
    address = json['address']??"";
    lat = json['lat']??0;
    lon = json['lon']??0;
    countryTitle = json['country_title']??"";
    stateTitle = json['state_title']??"";
    cityTitle = json['city_title']??"";
    adminstratorName = json['adminstrator_name']??"";
    adminstratorPhone = json['adminstrator_phone']??"";
    about = json['about']??"";
    workYear = json['work_year']??"";
    graduationYear = json['graduation_year']??"";
    universityId = json['university_id']??0;
    universityTitle = json['university_title']??"";
    graduationDegree = json['graduation_degree']??"";
    cv = json['cv']??"";
    isFollow = json['is_follow']??0;
    if(json['certificates']!= null){
      certificates = List.castFrom<dynamic, String>(json['certificates']);
    }else{
      certificates =[];
    }
    waitingTime = json['waiting_time']??0;
    price = json['price']??0;
    workAddress = json['work_address']??"";
    if(json['insurances']!=null){
      insurances = List.from(json['insurances']).map((e)=>InsuranceModel.fromJson(e)).toList();
    }

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
    id = json['id']??0;
    title = json['title']??"";
    selected = json['selected']??false;
  }
}

class Scientificlevel {
  Scientificlevel({
    required this.id,
    required this.title,
  });
  late final int id;
  late final String title;

  Scientificlevel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??'';
  }

}

// class Insurances {
//   Insurances({
//     required this.id,
//     required this.title,
//     required this.image,
//   });
//   late final int id;
//   late final String title;
//   late final String image;
//
//   Insurances.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     title = json['title'];
//     image = json['image'];
//   }
//
// }
//
// class UserProfileModel {
//   UserProfileModel({
//     required this.id,
//     required this.name,
//     required this.phone,
//     required this.followingsNumber,
//     required this.followersNumber,
//     required this.image,
//     required this.cover,
//     required this.rateNumber,
//     required this.averageRate,
//     required this.specializations,
//     required this.experienceYears,
//     required this.patients,
//     required this.gender,
//     required this.scientificlevel,
//     required this.userTypeId,
//     required this.taxNumber,
//     required this.taxNumberImage,
//     required this.logRecord,
//     required this.logRecordImage,
//     required this.workLisence,
//     this.countryId,
//     required this.stateId,
//     required this.cityId,
//     required this.address,
//     required this.lat,
//     required this.lon,
//     required this.countryTitle,
//     required this.stateTitle,
//     required this.cityTitle,
//     required this.adminstratorName,
//     required this.adminstratorPhone,
//     required this.about,
//     required this.workYear,
//     required this.graduationYear,
//     this.universityId,
//     required this.universityTitle,
//     required this.graduationDegree,
//     required this.cv,
//     required this.certificates,
//     required this.waitingTime,
//     required this.price,
//     required this.workAddress,
//     required this.insurances,
//   });
//   late final int id;
//   late final String name;
//   late final String phone;
//   late final int followingsNumber;
//   late final int followersNumber;
//   late final String image;
//   late final String cover;
//   late final int rateNumber;
//   late final int averageRate;
//   late final List<Specializations> specializations;
//   late final String experienceYears;
//   late final int patients;
//   late final String gender;
//   late final String scientificlevel;
//   late final int userTypeId;
//   late final String taxNumber;
//   late final String taxNumberImage;
//   late final String logRecord;
//   late final String logRecordImage;
//   late final String workLisence;
//   late final Null countryId;
//   late final int stateId;
//   late final int cityId;
//   late final String address;
//   late final double lat;
//   late final double lon;
//   late final String countryTitle;
//   late final String stateTitle;
//   late final String cityTitle;
//   late final String adminstratorName;
//   late final String adminstratorPhone;
//   late final String about;
//   late final String workYear;
//   late final String graduationYear;
//   late final Null universityId;
//   late final String universityTitle;
//   late final String graduationDegree;
//   late final String cv;
//   late final List<String> certificates;
//   late final int waitingTime;
//   late final int price;
//   late final String workAddress;
//   late final List<Insurances> insurances;
//
//   UserProfileModel.fromJson(Map<String, dynamic> json){
//     id = json['id']??0;
//     name = json['name'];
//     phone = json['phone'];
//     followingsNumber = json['followings_number'];
//     followersNumber = json['followers_number'];
//     image = json['image'];
//     cover = json['cover'];
//     rateNumber = json['rate_number'];
//     averageRate = json['average_rate'];
//     specializations = List.from(json['specializations']).map((e)=>Specializations.fromJson(e)).toList();
//     experienceYears = json['experience_years'];
//     patients = json['patients'];
//     gender = json['gender'];
//     scientificlevel = json['scientificlevel'];
//     userTypeId = json['user_type_id'];
//     taxNumber = json['tax_number'];
//     taxNumberImage = json['tax_number_image'];
//     logRecord = json['log_record'];
//     logRecordImage = json['log_record_image'];
//     workLisence = json['work_lisence'];
//     countryId = null;
//     stateId = json['state_id'];
//     cityId = json['city_id'];
//     address = json['address'];
//     lat = json['lat'];
//     lon = json['lon'];
//     countryTitle = json['country_title'];
//     stateTitle = json['state_title'];
//     cityTitle = json['city_title'];
//     adminstratorName = json['adminstrator_name'];
//     adminstratorPhone = json['adminstrator_phone'];
//     about = json['about'];
//     workYear = json['work_year'];
//     graduationYear = json['graduation_year'];
//     universityId = null;
//     universityTitle = json['university_title'];
//     graduationDegree = json['graduation_degree'];
//     cv = json['cv'];
//     certificates = List.castFrom<dynamic, String>(json['certificates']);
//     waitingTime = json['waiting_time'];
//     price = json['price'];
//     workAddress = json['work_address'];
//     insurances = List.from(json['insurances']).map((e)=>Insurances.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['phone'] = phone;
//     _data['followings_number'] = followingsNumber;
//     _data['followers_number'] = followersNumber;
//     _data['image'] = image;
//     _data['cover'] = cover;
//     _data['rate_number'] = rateNumber;
//     _data['average_rate'] = averageRate;
//     _data['specializations'] = specializations.map((e)=>e.toJson()).toList();
//     _data['experience_years'] = experienceYears;
//     _data['patients'] = patients;
//     _data['gender'] = gender;
//     _data['scientificlevel'] = scientificlevel;
//     _data['user_type_id'] = userTypeId;
//     _data['tax_number'] = taxNumber;
//     _data['tax_number_image'] = taxNumberImage;
//     _data['log_record'] = logRecord;
//     _data['log_record_image'] = logRecordImage;
//     _data['work_lisence'] = workLisence;
//     _data['country_id'] = countryId;
//     _data['state_id'] = stateId;
//     _data['city_id'] = cityId;
//     _data['address'] = address;
//     _data['lat'] = lat;
//     _data['lon'] = lon;
//     _data['country_title'] = countryTitle;
//     _data['state_title'] = stateTitle;
//     _data['city_title'] = cityTitle;
//     _data['adminstrator_name'] = adminstratorName;
//     _data['adminstrator_phone'] = adminstratorPhone;
//     _data['about'] = about;
//     _data['work_year'] = workYear;
//     _data['graduation_year'] = graduationYear;
//     _data['university_id'] = universityId;
//     _data['university_title'] = universityTitle;
//     _data['graduation_degree'] = graduationDegree;
//     _data['cv'] = cv;
//     _data['certificates'] = certificates;
//     _data['waiting_time'] = waitingTime;
//     _data['price'] = price;
//     _data['work_address'] = workAddress;
//     _data['insurances'] = insurances.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Specializations {
//   Specializations({
//     required this.id,
//     required this.title,
//     required this.selected,
//   });
//   late final int id;
//   late final String title;
//   late final bool selected;
//
//   Specializations.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     title = json['title'];
//     selected = json['selected'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['title'] = title;
//     _data['selected'] = selected;
//     return _data;
//   }
// }
//
// class Insurances {
//   Insurances({
//     required this.id,
//     required this.title,
//     required this.image,
//   });
//   late final int id;
//   late final String title;
//   late final String image;
//
//   Insurances.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     title = json['title'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['title'] = title;
//     _data['image'] = image;
//     return _data;
//   }
// }