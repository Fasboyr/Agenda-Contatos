import 'package:aula_flutter/app/database/sqlite/script.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Connection{
  static Database? _db;

  static Future<Database?> get() async{
    if(_db == null){
      if (kIsWeb) {
        databaseFactory = databaseFactoryFfiWeb;
      }
      var path = join(await getDatabasesPath(), 'banco_contatos');
      //deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate:(db, v){
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        },
        ); 

    }
    return _db;
  }
  
}