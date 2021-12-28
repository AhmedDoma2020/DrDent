
class SpecializationModel {
  SpecializationModel({
    required this.id,
    required this.title,
    this.active =false,
  });
  late final int id;
  late final String title;
  late final String image;
  late bool active;

  SpecializationModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    active = false;
  }
}

List<SpecializationModel> specializationListExamples = [
  SpecializationModel(
    title: "شرك هيلثى لايف للتأمين",
    id: 1,
    active: false,
  ),
  SpecializationModel(
    title: "شركة هيلثى للتأمين",
    id: 2,
    active: false,
  ),
  SpecializationModel(
    title: "شركة هيلثى لايف",
    id: 3,

    active: false,
  ),
  SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 4,

    active: false,
  ),
  SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 5,

    active: false,
  ),
  SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 6,

    active: false,
  ),
  SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 7,

    active: false,
  ),SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 8,

    active: false,
  ),SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 9,

    active: false,
  ),SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 10,

    active: false,
  ),SpecializationModel(
    title: "شركة لايف للتأمين",
    id: 11,

    active: false,
  ),SpecializationModel(
    title: " لايف للتأمين",
    id: 12,

    active: false,
  ),
];
