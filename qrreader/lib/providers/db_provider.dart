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
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tipo TEXT,
            valor TEXT
          )
        '''
        );

      },
      );    
    

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
    Future<int>nuevoScan(SearchResponse nuevoscan)async{
      final db = await database;
      
      final res = await db.insert(
        'Scans', nuevoscan.toJson()
        
      );
      //nuevoscan.setId(res);
      print(res);
      return res;

    }
}

