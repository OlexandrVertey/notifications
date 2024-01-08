import 'package:notifications/models/notifications_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OneTimeDB {
  // Singleton pattern
  static final OneTimeDB _databaseService = OneTimeDB.internal();
  factory OneTimeDB() => _databaseService;
  OneTimeDB.internal();

  static Database? _database;
  Future<Database> get database async {
    print('------database 1');
    if (_database != null) return _database!;
    _database = await _initDatabase(1);
    return _database!;
  }

  Future<Database> _initDatabase(int version) async {
    print('------database 2 = ${version}');
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'oneTimeDB.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: version,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  ///TODO: створює таблицю в базі даних
  Future<void> _onCreate(Database db, int version) async {
    print('------database 3');
    await db.execute(
      'CREATE TABLE OneTimeDB(id INTEGER PRIMARY KEY, time TEXT, message TEXT, icon TEXT, backColorIcon TEXT)',
    );
  }

  ///TODO: create
  Future<void> createOneTimeDB(OneTimeNotificationsModel oneTimeNotificationsModel) async {
    print("------db oneTimeNotificationsModel = ${oneTimeNotificationsModel.id}");
    print("------db oneTimeNotificationsModel = ${oneTimeNotificationsModel.time}");
    print("------db oneTimeNotificationsModel = ${oneTimeNotificationsModel.message}");
    print("------db oneTimeNotificationsModel = ${oneTimeNotificationsModel.icon}");
    print("------db oneTimeNotificationsModel = ${oneTimeNotificationsModel.backColorIcon}");
    final db = await _databaseService.database;
    await db.insert(
      'OneTimeDB',
      oneTimeNotificationsModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///TODO: update
  Future<void> updateOneTimeDB(OneTimeNotificationsModel oneTimeNotificationsModel) async {
    final db = await _databaseService.database;
    await db.update(
      'OneTimeDB',
      oneTimeNotificationsModel.toMap(),
      where: 'id = ?',
      whereArgs: [oneTimeNotificationsModel.id],
    );
  }

  ///TODO: get db
  Future<List<OneTimeNotificationsModel>> getOneTimeDB() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('OneTimeDB');
    return List.generate(maps.length, (index) => OneTimeNotificationsModel.fromMap(maps[index]));
  }

  ///TODO: delete db
  Future<void> deleteOneTimeDB(List<OneTimeNotificationsModel> oneTimeNotificationsModel) async {
    print('-----ontap 3 logout');
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'oneTimeDB.db');
    print('-----ontap 4 logout');
    await databaseFactory.deleteDatabase(path);
  }

  ///TODO: delete item from db
  Future<void> deleteItem(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      "OneTimeDB",     // replace with table name
      where: "id = ?",
      whereArgs: [id],   // you need the id
    );
  }

  Future<bool> databaseExists() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'oneTimeDB.db');
    return databaseFactory.databaseExists(path);
  }
}