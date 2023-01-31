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
  late String? searchTerm;
  late String? categoryName;
  late int? itemCount;
  late String? redirectUrl;
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
    print('01');
    this.categoryName = map['categoryName'];
    this.itemCount = map['itemCount'];
    print('02');
    this.redirectUrl = map['redirectUrl'];
    print('04');
    this.products = [];
    (map['products'] as List).forEach((element) {
      this.products.add(Product.fromMap(element));
      print('03');
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
