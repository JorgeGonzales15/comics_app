import 'package:sqflite/sqflite.dart';
import 'package:super_comics_app/database/app_database.dart';
import 'package:super_comics_app/models/superhero.dart';

class SuperheroDao {
   insert(SuperHero hero) async {
    Database db = await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, hero.toMap());
  }

  delete(SuperHero hero) async {
    Database db = await AppDatabase().openDb();
    await db
        .delete(AppDatabase().tableName, where: "id = ?", whereArgs: [hero.id]);
  }

  Future<bool> isFavorite(SuperHero hero) async {
    Database db = await AppDatabase().openDb();
    List maps = await db
        .query(AppDatabase().tableName, where: "id = ?", whereArgs: [hero.id]);

    return maps.isNotEmpty;
  }

  Future<List<FavoriteHero>>fetchAll() async {
    Database db = await AppDatabase().openDb();
    List maps = await db.query(AppDatabase().tableName);
    return maps.map((map) => FavoriteHero.fromMap(map)).toList();
  }
}