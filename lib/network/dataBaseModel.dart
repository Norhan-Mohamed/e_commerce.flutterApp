class DataBaseModel {
  late int id;
  late String name;
  late String colour;
  late int colourWayId;
  late String brandName;
  late String imageUrl;

  DataBaseModel({
    required this.id,
    required this.name,
    required this.colour,
    required this.imageUrl,
    required this.brandName,
    required this.colourWayId,
  });

  DataBaseModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.colour = map['colour'];
    this.imageUrl = map['imageUrl'];
    this.brandName = map['brandName'];
    this.colourWayId = map['colourWayId'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "name": this.name,
      "colour": this.colour,
      "imageUrl": this.imageUrl,
      "brandName": this.brandName,
      "colourWayId": this.colourWayId,
    };
    return map;
  }
}
