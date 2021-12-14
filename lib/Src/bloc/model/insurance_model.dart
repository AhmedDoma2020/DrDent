
class InsuranceModel {
  InsuranceModel({
    required this.id,
    required this.title,
    required this.image,
    this.active =false,
  });
  late final int id;
  late final String title;
  late final String image;
  late bool active;

  InsuranceModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    title = json['title'];
    active = false;
  }
}

List<InsuranceModel> insuranceListExamples = [
  InsuranceModel(
    title: "شرك هيلثى لايف للتأمين",
    id: 1,
    image: "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),
  InsuranceModel(
    title: "شركة هيلثى للتأمين",
    id: 2,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),
  InsuranceModel(
    title: "شركة هيلثى لايف",
    id: 3,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),
  InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 4,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),
  InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 5,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),
  InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 6,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),
  InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 7,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 8,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 9,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 10,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),InsuranceModel(
    title: "شركة لايف للتأمين",
    id: 11,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),InsuranceModel(
    title: " لايف للتأمين",
    id: 12,
    image:
    "https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
    active: false,
  ),
];

List<InsuranceModel> insuranceList = [
InsuranceModel(
title: "شركة هيلثى لايف للتأمين",
id: 1,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
),
InsuranceModel(
title: "شركة هيلثى للتأمين",
id: 2,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
),
InsuranceModel(
title: "شركة هيلثى لايف",
id: 3,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
),
InsuranceModel(
title: "شركة لايف للتأمين",
id: 4,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
), InsuranceModel(
title: "شركة لايف للتأمين",
id: 5,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
), InsuranceModel(
title: "شركة لايف للتأمين",
id: 6,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
), InsuranceModel(
title: "شركة لايف للتأمين",
id: 7,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
), InsuranceModel(
title: "شركة لايف للتأمين",
id: 8,
image:
"https://cdn.pixabay.com/photo/2018/03/31/23/33/clean-3279626_960_720.jpg",
),
];