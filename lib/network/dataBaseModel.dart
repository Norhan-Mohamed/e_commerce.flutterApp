import 'package:e_commerce/network/cartDatabase.dart';

class DataBaseModel {
  int? id;
  late String name;
  late String colour;
  late int colourWayId;
  late String brandName;
  late String imageUrl;
  late double? price;

  DataBaseModel({
    required this.id,
    required this.name,
    required this.colour,
    required this.imageUrl,
    required this.brandName,
    required this.colourWayId,
    required this.price,
  });

  DataBaseModel.fromMap(Map<String, dynamic> map) {
    if (map[columnid] != null) {
      this.id = map[columnid];
    }
    this.name = map[columnname];
    print('10');
    this.colour = map[columncolour];
    this.imageUrl = map[columnimageUrl];
    this.brandName = map[columnbrandName];
    print('20');
    this.price = map[columnprice];
    print("9");
    this.colourWayId = int.parse(map[columncolourWayId]);
    print('30');
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (this.id != null) {
      map[columnid] = this.id;
    }

    map[columnname] = this.name;
    map[columncolour] = this.colour;
    map[columnimageUrl] = this.imageUrl;
    map[columnbrandName] = this.brandName;
    map[columncolourWayId] = this.colourWayId;
    map[columnprice] = this.price;

    return map;
  }
}
