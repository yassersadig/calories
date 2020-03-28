import 'package:calories/models/item.dart';
import 'package:calories/providers/databaseProvider.dart';

newItem(Item newItem) async {
  // DatabaseProvider dbProvider = DatabaseProvider._();
  final db = await DatabaseProvider.provider.database;
  //get the biggest id in the table
  var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Items");
  int id = table.first["id"];
  //insert to the table using the new id

  var raw = await db.rawInsert(
      "INSERT Into Items (id,name,calories,protein)"
      " VALUES (?,?,?,?)",
      [id, newItem.name, newItem.protein, newItem.calories]);
  return raw;
}

getItem(int id) async {
  final db = await DatabaseProvider.provider.database;
  var res = await db.query("Item", where: "id = ?", whereArgs: [id]);
  return res.isNotEmpty ? Item.fromMap(res.first) : Null;
}

Future<List<Item>> getAllItems() async {
  final db = await DatabaseProvider.provider.database;
  var res = await db.query("Items");
  List<Item> list =
      res.isNotEmpty ? res.map((c) => Item.fromMap(c)).toList() : [];
  return list;
}

updateItem(Item newItem) async {
  final db = await DatabaseProvider.provider.database;
  var res = await db.update("Item", newItem.toMap(),
      where: "id = ?", whereArgs: [newItem.id]);
  return res;
}

deleteItem(int id) async {
  final db = await DatabaseProvider.provider.database;
  db.delete("Item", where: "id = ?", whereArgs: [id]);
}
