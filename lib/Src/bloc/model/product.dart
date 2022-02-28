class Product{


  int? id;
  String? title;
  String? description;
  List<String>? images;
  int? rate;
  int? like;
  String? price;
  String? categoryTitle;
  String? companyName;
  int? companyId;
  String? expireDate;
  String? usability;
  String? generalUse;
  String? sideEffects;
  String? storeName;
  int? storeId;
  int? categoryId;


  Product(
  {
    this.id,
    this.title,
    this.description,
    this.images,
    this.rate,
    this.like,
    this.price,
    this.categoryTitle,
    this.companyName,
    this.companyId,
    this.expireDate,
    this.usability,
    this.generalUse,
    this.sideEffects,
    this.storeName,
    this.storeId,
    this.categoryId
});


  Product.fromJson(Map<String,dynamic> map){
    id = map['id']??0;
    title = map['title']??'';
    description = map['description']??'';
    images = map['images']!=null ? map['images'].cast<String>():[];
    rate = map['rate']??0;
    like = map['like']??0;
    price = map['price']??'';
    categoryTitle = map['category_title']??'';
    companyId = map['company_id']??'';
    companyName = map['company_name']??'';
    expireDate = map['expire_date']??'';
    usability = map['usability']??'';
    generalUse = map['general_use']??'';
    sideEffects = map['side_effects']??'';
    storeName = map['store_name']??'';
    storeId = map['store_id']??0;
    categoryId = map['category_id']??0;
  }

}
