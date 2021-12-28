
class ScientificModel {
  ScientificModel({
    required this.id,
    required this.title,
    required this.selected,
  });
  late final int id;
  late final String title;
  late final String image;
  late  bool selected;

  ScientificModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
  }
}

List<ScientificModel> scientificListExamples = [
  ScientificModel(
    title: "شرك هيلثى لايف للتأمين",
    id: 1,
    selected: false,
  ),
  ScientificModel(
    title: "شركة هيلثى للتأمين",
    id: 2,
    selected: false,
  ),
  ScientificModel(
    title: "شركة هيلثى لايف",
    id: 3,

    selected: false,
  ),
  ScientificModel(
    title: "شركة لايف للتأمين",
    id: 4,

    selected: false,
  ),
  ScientificModel(
    title: "شركة لايف للتأمين",
    id: 5,

    selected: false,
  ),
  ScientificModel(
    title: "شركة لايف للتأمين",
    id: 6,

    selected: false,
  ),
  ScientificModel(
    title: "شركة لايف للتأمين",
    id: 7,

    selected: false,
  ),ScientificModel(
    title: "شركة لايف للتأمين",
    id: 8,

    selected: false,
  ),ScientificModel(
    title: "شركة لايف للتأمين",
    id: 9,

    selected: false,
  ),ScientificModel(
    title: "شركة لايف للتأمين",
    id: 10,

    selected: false,
  ),ScientificModel(
    title: "شركة لايف للتأمين",
    id: 11,

    selected: false,
  ),ScientificModel(
    title: " لايف للتأمين",
    id: 12,
    selected: false,
  ),
];
