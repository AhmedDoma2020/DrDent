

class DetectionLocationDetailsModel {
  DetectionLocationDetailsModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.mobile,
    required this.price,
    required this.detectionTime,
    required this.reservationType,
    required this.image,
    required this.city,
    required this.address,
    required this.bulidingNumber,
    required this.flatNumber,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String mobile;
  late final String price;
  late final String detectionTime;
  late final int reservationType;
  late final String image;
  late final String city;
  late final String address;
  late final String bulidingNumber;
  late final String flatNumber;

  DetectionLocationDetailsModel.fromJson(Map<String, dynamic> json){
    id = json['id']??"";
    name = json['name']??"";
    phone = json['phone']??"";
    mobile = json['mobile']??"";
    price = json['price']??"";
    detectionTime = json['detection_time']??"";
    reservationType = json['reservation_type']??"";
    image = json['image']??"";
    city = json['city']??"";
    address = json['address']??"";
    bulidingNumber = json['buliding_number']??"";
    flatNumber = json['flat_number']??"";
  }
}