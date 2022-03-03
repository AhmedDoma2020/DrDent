import 'package:dr_dent/Src/features/HomeFeature/ui/widgets/home_item.dart';
import 'package:get/get.dart';


class InfoRequestModel{
    int? id;
    String? name;
    String? phone;

    InfoRequestModel({this.id, this.name, this.phone});

    InfoRequestModel.fromJson(Map<String,dynamic> map){
      id = map['id']??0;
      name = map['name']??'';
      phone = map['phone']??'';
    }
}

