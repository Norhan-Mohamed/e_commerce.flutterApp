import 'package:e_commerce/api/products.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String columnname = 'name';
final String columnid = 'id';
final String columnimageUrl = 'imageUrl';
final String columncolour = 'colour';
final String columncolourWayId = 'colourWayId';
final String columnbrandName = 'brandName';
final String columnproductCode = 'productCode';
final String columnproductType = 'productType';
final String columnurl = 'url';
final String columnprice = 'price';
final String columnisSellingFast = ' isSellingFast ';
final String columnhasVariantColours = ' hasVariantColours';
final String columnhasMultiplePrices = ' hasMultiplePrices';
final String columnvalue = 'value';
final String columntext = 'text';
final String columnisOutletPrice = 'isOutletPrice';
final String columnisMarkedDown = 'isMarkedDown';
final String columnCurrency = 'currency';
/*
class Providar {
  late String id;
  late String name;
  late bool isSellingFast;
  late bool hasVariantColours;
  late bool hasMultiplePrices;
  late String imageUrl;
  late String colour;
  late String colourWayId;
  late String brandName;
  late String productCode;
  late String productType;
  late String url;
  late String price;
  late num value;
  late String text;
  late bool isOutletPrice;
  late bool isMarkedDown;
  late String Currency;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnname: name,
      columnid: id,
      columnimageUrl: imageUrl,
      columncolour: colour,
      columncolourWayId: colourWayId,
      columnbrandName: brandName,
      columnproductCode: productCode,
      columnproductType: productType,
      columnurl: url,
      columnprice: price,
      columnisSellingFast: isSellingFast == true ? 1 : 0,
      columnhasVariantColours: hasVariantColours == true ? 1 : 0,
      columnhasMultiplePrices: hasMultiplePrices == true ? 1 : 0,
      columnvalue: value,
      columntext: text,
      columnisOutletPrice: isOutletPrice == true ? 1 : 0,
      columnisMarkedDown: isMarkedDown == true ? 1 : 0,
      columnCurrency: Currency,
    };
    if (id != null) {
      map[columnid] = id;
    }
    return map;
  }

  Providar();

  Providar.fromMap(Map<String, dynamic> map) {
    id = map[columnid];
    name = map[columnname];
    imageUrl = map[columnimageUrl];
    colour = map[columncolour];
    colourWayId = map[columncolourWayId];
    brandName = map[columnbrandName];
    productCode = map[columnproductCode];
    productType = map[columnproductType];
    url = map[columnurl];
    price = map[columnprice];
    isSellingFast = map[columnisSellingFast] == 1;
    hasVariantColours = map[columnhasVariantColours] == 1;
    hasMultiplePrices = map[columnhasMultiplePrices] == 1;
    value = map[columnvalue];
    text = map[columntext];
    isOutletPrice = map[columnisOutletPrice] == 1;
    isMarkedDown = map[columnisMarkedDown] == 1;
    Currency = map[columnCurrency];
  }
}*/

class CartDataProvider {
  late Database db;
  static final CartDataProvider instance = CartDataProvider._internal();

  factory CartDataProvider() {
    return instance;
  }
  CartDataProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'product.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table ProductTable ( 
  $columnid integer ,
  $columnname text ,
  $columnimageUrl text ,
  $columncolour text ,
  $columncolourWayId text ,
$columnbrandName text ,
$columnproductCode text,
$columnproductType text ,
$columnurl text ,
$columnprice text ,
 $columnisSellingFast  integer ,
 $columnhasVariantColours integer ,
 $columnhasMultiplePrices integer,
$columnvalue Real ,
$columntext  text ,
$columnisOutletPrice integer,
$columnisMarkedDown integer,
$columnCurrency  text 

  
  )
''');
    });
  }

  Future<List<Product>> getData() async {
    List<Map<String, dynamic>> maps = await db.query('ProductTable');
    if (maps.isEmpty)
      return [];
    else {
      List<Product> products = [];
      maps.forEach((element) {
        products.add(Product.fromMap(element as Map<String, dynamic>));
      });
      print(maps);
      return products;
    }
  }

  Future<Product> insert(Product product) async {
    product.id = await db.insert('ProductTable', product.toMap());
    return product;
  }

  Future<int> delete(int? id) async {
    return await db.delete('ProductTable', where: '$id = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
