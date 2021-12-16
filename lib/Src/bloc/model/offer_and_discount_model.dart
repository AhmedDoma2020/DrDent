
import 'package:dr_dent/Src/bloc/model/service_model.dart';

class OfferAndDiscountModel {
  OfferAndDiscountModel({
    required this.id,
    required this.offerStatus,
    required this.ownerName,
    required this.name,
    required this.image,
    required this.priceAfterDiscount,
    required this.startDate,
    required this.price,
    required this.endDate,
    required this.bookingInfo,
    required this.offerInfo,
    required this.services,
  });
  late final int id;
  late final int offerStatus;
  late final String ownerName;
  late final String name;
  late final String image;
  late final String priceAfterDiscount;
  late final String startDate;
  late final String price;
  late final String endDate;
  late final String bookingInfo;
  late final String offerInfo;
  late final List<ServiceModel> services;

  OfferAndDiscountModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    offerStatus = json['ofer_status'];
    image = json['image'];
    ownerName = json['owner_name'];
    name = json['name'];
    priceAfterDiscount = json['price_after_discount'];
    startDate = json['start_date'];
    price = json['price'];
    endDate = json['end_date'];
    bookingInfo = json['booking_info'];
    offerInfo = json['offer_info'];
    // services = json['Services'];
  }
}

List<OfferAndDiscountModel> offerAndDiscountListExamples = [
  OfferAndDiscountModel(
    offerStatus: 0,
    ownerName: "مركز وايتي كلينيك",
    name: "شرك هيلثى لايف للتأمين",
    id: 1,
    image: "https://images.pexels.com/photos/1018425/pexels-photo-1018425.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),
  OfferAndDiscountModel(
    offerStatus: 1,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة هيلثى للتأمين",
    id: 2,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),
  OfferAndDiscountModel(
    offerStatus: 1,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة هيلثى لايف",
    id: 3,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),
  OfferAndDiscountModel(
    offerStatus: 0,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 4,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),
  OfferAndDiscountModel(
    offerStatus: 1,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 5,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),
  OfferAndDiscountModel(
    offerStatus: 0,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 6,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),
  OfferAndDiscountModel(
    offerStatus: 1,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 7,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),OfferAndDiscountModel(
    offerStatus: 0,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 8,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),OfferAndDiscountModel(
    offerStatus: 1,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 9,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),OfferAndDiscountModel(
    offerStatus: 0,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 10,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),OfferAndDiscountModel(
    offerStatus: 1,
    ownerName: "مركز وايتي كلينيك",
    name: "شركة لايف للتأمين",
    id: 11,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),OfferAndDiscountModel(
    offerStatus: 0,
    ownerName: "مركز وايتي كلينيك",
    name: " لايف للتأمين",
    id: 12,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    priceAfterDiscount: "135",
    price: "400",
    bookingInfo: "onfooooo",
    endDate: "aaaa",
    offerInfo: "asdsd",
    services: myServiceModelExample,
    startDate:"ssssss",
  ),
];
