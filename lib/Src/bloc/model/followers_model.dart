

class FollowersModel {
  FollowersModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFollowing,
    required this.specializations,
  });
  late final int id;
  late final String name;
  late final String image;
  late final int isFollowing;
  late final String specializations;

  FollowersModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isFollowing = json['is_following'];
    specializations = json['specializations'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['is_following'] = isFollowing;
    _data['specializations'] = specializations;
    return _data;
  }
}
