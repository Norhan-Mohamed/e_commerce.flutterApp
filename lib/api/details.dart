import 'package:e_commerce/api/priceDetails.dart';

class Details {
  late int id;
  late String name;
  late String description;
  late String gender;
  late String productCode;

  late bool isInStock;

  late List<PriceDetails> price;

  Details({
    required this.id,
    required this.name,
    required this.description,
    required this.gender,
    required this.productCode,
    required this.isInStock,
    required this.price,
  });

  Details.FromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["name"];
    this.description = map["description"];
    this.gender = map["gender"];

    this.isInStock = map["isInStock"];

    this.price = [];
  }

  Map<String, dynamic> toMap() {
    List<Map> list = [];
    this.price.forEach((element) => list.add(element.toMap()));
    Map<String, dynamic> map = {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "gender": this.gender,
      "productCode": this.productCode,
      "price": list,
    };
    return map;
  }
}
