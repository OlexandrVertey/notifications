import 'package:notifications/models/recurring_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RecurringDB {
  // Singleton pattern
  static final RecurringDB _databaseService = RecurringDB.internal();
  factory RecurringDB() => _databaseService;
  RecurringDB.internal();

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
    final path = join(databasePath, 'recurringDB.db');
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
      'CREATE TABLE RecurringDB(id INTEGER PRIMARY KEY, time TEXT, message TEXT, icon TEXT, backColorIcon TEXT)',
    );
  }

  ///TODO: create
  Future<void> createRecurringDB(RecurringModel recurringModel) async {
    final db = await _databaseService.database;
    await db.insert(
      'RecurringDB',
      recurringModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///TODO: update
  Future<void> updateRecurringDB(RecurringModel recurringModel) async {
    final db = await _databaseService.database;
    await db.update(
      'RecurringDB',
      recurringModel.toMap(),
      where: 'id = ?',
      whereArgs: [recurringModel.id],
    );
  }

  ///TODO: get db
  Future<List<RecurringModel>> getRecurringDB() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('RecurringDB');
    return List.generate(maps.length, (index) => RecurringModel.fromMap(maps[index]));
  }

  ///TODO: delete db
  Future<void> deleteRecurringDB(List<RecurringModel> recurringModel) async {
    print('-----ontap 3 logout');
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'recurringDB.db');
    print('-----ontap 4 logout');
    await databaseFactory.deleteDatabase(path);
  }

  ///TODO: delete item from db
  Future<void> deleteItem(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      "RecurringDB",     // replace with table name
      where: "id = ?",
      whereArgs: [id],   // you need the id
    );
  }

  Future<bool> databaseExists() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'recurringDB.db');
    return databaseFactory.databaseExists(path);
  }
}