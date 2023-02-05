import 'package:e_commerce/network/dataBaseModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String columnname = 'name';
final String columnid = 'id';
final String columnimageUrl = 'imageUrl';
final String columncolour = 'colour';
final String columncolourWayId = 'colourWayId';
final String columnbrandName = 'brandName';

class FavDataProvider {
  late Database db;

  static final FavDataProvider instance = FavDataProvider._internal();

  factory FavDataProvider() {
    return instance;
  }
  FavDataProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'product.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table ProductTable ( 
$columnid integer ,
$columnname text not null,
$columnimageUrl text ,
$columncolour text ,
$columncolourWayId text ,
$columnbrandName text ,

  )
''');
    });
  }

  Future<List<DataBaseModel>> getData() async {
    List<Map<String, dynamic>> maps = await db.query('ProductTable');
    if (maps.isEmpty)
      return [];
    else {
      List<DataBaseModel> favproducts = [];
      maps.forEach((element) {
        favproducts.add(DataBaseModel.fromMap(element as Map<String, dynamic>));
      });
      print(maps);
      return favproducts;
    }
  }

  Future<DataBaseModel> insert(DataBaseModel dataBaseModel) async {
    dataBaseModel.id = await db.insert('ProductTable', dataBaseModel.toMap());
    return dataBaseModel;
  }

  Future<int> delete(int id) async {
    return await db.delete('ProductTable', where: '$id = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
