import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dataBaseModel.dart';

final String columnname = 'name';
final String columnid = 'id';
final String columnimageUrl = 'imageUrl';
final String columncolour = 'colour';
final String columncolourWayId = 'colourWayId';
final String columnbrandName = 'brandName';
final String columnprice = 'price';

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
$columnprice real
  
  )
''');
    });
  }

  Future<List<DataBaseModel>> getData() async {
    List<Map<String, dynamic>> maps = await db.query('ProductTable');
    if (maps.isEmpty)
      return [];
    else {
      List<DataBaseModel> products = [];
      maps.forEach((element) {
        products.add(DataBaseModel.fromMap(element as Map<String, dynamic>));
      });
      print(maps);
      return products;
    }
  }

  Future<DataBaseModel> insert(DataBaseModel dataBaseModel) async {
    dataBaseModel.id = await db.insert('ProductTable', dataBaseModel.toMap());
    return dataBaseModel;
  }

  Future<int> delete(int id) async {
    return await db
        .delete('ProductTable', where: '$columnid = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
