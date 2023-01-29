import 'package:e_commerce/api/products.dart';

/*
class ListsData {
  late Map<String, dynamic> lists;
  ListsData({required this.lists});

  ListsData.fromMap(List<dynamic> map) {
    lists = [];
    ((map) as List<dynamic>).forEach((element) {
      lists.add(element);
    });
  }

  Map<String, dynamic> toMap() {
    List productsList = [];
    lists.forEach((element) => productsList.add(element));
    Map<String, dynamic> map = {'lists': productsList};
    return map;
  }
}
*/
class Lists {
  late String searchTerm;
  late String categoryName;
  late int itemCount;
  late String redirectUrl;
  late List<Product> products;

  Lists({
    required this.searchTerm,
    required this.categoryName,
    required this.itemCount,
    required this.redirectUrl,
    required this.products,
  });

  Lists.fromMap(Map<String, dynamic> map) {
    this.searchTerm = map['searchTerm'];
    this.categoryName = map['categoryName'];
    this.itemCount = map['itemCount'];
    this.redirectUrl = map['redirectUrl'];
    this.products = map['products'];
    (map['products'] as List<Product>).forEach((element) {
      this.products!.add(element); ///////
    });
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "searchTerm": this.searchTerm,
      "categoryName": this.categoryName,
      "itemCount ": this.itemCount,
      "redirectUrl": this.redirectUrl,
      "products": this.products as List<Product>,
    };
    return map;
  }
}
