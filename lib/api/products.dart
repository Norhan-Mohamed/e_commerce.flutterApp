import 'package:e_commerce/api/price.dart';

class Product {
  late int id;
  late String name;
  late Price price;
  late String colour;
  late int colourWayId;
  late String brandName;
  late bool hasVariantColours;
  late bool hasMultiplePrices;
  late int productCode;
  late String productType;
  late String url;
  late String imageUrl;
  late bool isSellingFast;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.colour,
    required this.url,
    required this.brandName,
    required this.colourWayId,
    required this.hasMultiplePrices,
    required this.hasVariantColours,
    required this.imageUrl,
    required this.isSellingFast,
    required this.productCode,
    required this.productType,
  });

  Product.fromMap(Map<String, dynamic> map) {
    this.productType = map['productType'];
    this.id = map['id'];
    this.name = map['name'];
    price = Price.fromMap(map['price']);
    this.colour = map['colour'];
    this.url = map['url'];
    this.brandName = map['brandName'];
    this.colourWayId = map['colourWayId'];
    this.hasMultiplePrices = map['hasMultiplePrices'];
    this.hasVariantColours = map['hasVariantColours'];
    this.imageUrl = map['imageUrl'];
    this.isSellingFast = map['isSellingFast'];
    this.productCode = map['productCode'];
  }
  Map<String, dynamic> toMap() {
    /* List<Map> tmpPrice = [];
    this.price.forEach((element) {
      tmpPrice.add(element.toMap());
    });*/
    Map<String, dynamic> map = {
      "id": this.id,
      "name": this.name,
      "price ": this.price.toMap(),
      "colour": this.colour,
      "url": this.url,
      "brandName": this.brandName,
      "colourWayId": this.colourWayId,
      "hasMultiplePrices": this.hasMultiplePrices,
      "hasVariantColours": this.hasVariantColours,
      "imageUrl": this.imageUrl,
      "isSellingFast": this.isSellingFast,
      "productCode": this.productCode,
      "productType": this.productType,
    };
    return map;
  }
}
