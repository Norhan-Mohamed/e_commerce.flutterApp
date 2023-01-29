import 'package:e_commerce/api/products.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String name = 'name';
final String id = 'id';
final String imageUrl = 'imageUrl';

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
  $id integer ,
  $name text not null,
  $imageUrl text not null,
 
  )
''');
    });
  }

  Future<List<Product>> getData() async {
    List<Map<String, dynamic>> maps = await db.query('ProductTable');
    if (maps.isEmpty)
      return [];
    else {
      List<Product> favproducts = [];
      maps.forEach((element) {
        favproducts.add(Product.fromMap(element as Map<String, dynamic>));
      });
      print(maps);
      return favproducts;
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
