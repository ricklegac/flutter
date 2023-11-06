import 'dart:io';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrreader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DBProvider{
  static Database? _database;
  static final DBProvider db = DBProvider._(); //constructor privado. singletons
  DBProvider._(); //creacion de constructor privado

  Future<Database>get database async {
    if(_database != null){
      return _database!;

    }
    _database = await initDB();
    return _database!;
  }

  Future<Database>initDB() async {
    //path en donde almacenaremos todo
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = p.join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){

      }, 
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE Scans (
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
         )
        '''
        );

      },
      );    
    

  }
  Future<int> nuevoScan(SearchResponse nuevoscan) async {
    final db = await database;
    //print(db);
    final res = await db.insert('Scans', nuevoscan.toJson());

    // Update the id of the SearchResponse object with the value from the database.
    nuevoscan.setId(res);

    print(res);
    return res;
  }
  Future<int> nuevoScan2(SearchResponse nuevoscan) async {
  final db = await database;
  final res = await db.insert('Scans', nuevoscan.toJson());

  // Retrieve the last inserted ID using the 'last_insert_rowid()' SQL function.
  final lastInsertedId = Sqflite.firstIntValue(await db.rawQuery('SELECT last_insert_rowid()'));

  // Update the ID of the SearchResponse object with the last inserted ID.
  nuevoscan.setId(lastInsertedId!);

  return lastInsertedId;
}
  Future<int>nuevoScanRaw(SearchResponse nuevoscan) async{
    final id = nuevoscan.id;
    final tipo = nuevoscan.tipo;
    final valor = nuevoscan.valor;
    
    final db = await database;
    final res = await db.rawInsert('''
      Insert into Scans(id, tipo, valor) values
      ($id, $tipo, $valor);
    ''');
    return res;

  }
 

Future<SearchResponse?> getScanById(int id) async {
  try {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? SearchResponse.fromJson(res.first) : null;
  } catch (e) {
    // Handle any exceptions here, you can log or return null as needed.
    return null;
  }

  
}
Future<List<SearchResponse>> getAllId() async {
  try {
    final db = await database;
    final res = await db.query('Scans');

    return res.map((s)=>SearchResponse.fromJson(s)).toList();
  } catch (e) {
    // Handle any exceptions here, you can log or return null as needed.
    return [];
  }
}

Future<List<SearchResponse>> getAllTipos(String tipo) async {
  try {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans 
      WHERE tipo = $tipo
    ''');

    return res.map((s)=>SearchResponse.fromJson(s)).toList();
  } catch (e) {
    // Handle any exceptions here, you can log or return null as needed.
    return [];
  }
}
Future<int> updateScan(SearchResponse nuevoScan) async {
  final db = await database;
  final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
  return res;

}

Future<int> deleteScan(int id) async{
  final db = await database;
  final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
  return res;

}

Future<int> deleteAllScan() async{
  final db = await database;
  final res = await db.delete('Scans');
  return res;

}


}