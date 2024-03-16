
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

  static Database? _db ; 
  
  Future<Database?> get db async {
      if (_db == null){
        _db  = await intialDb() ;
        return _db ;  
      }else {
        return _db ; 
      }
  }


intialDb() async {
  String databasepath = await getDatabasesPath() ; 
  String path = join(databasepath , 'gymdb2.db') ;   
  Database mydb = await openDatabase(path , onCreate: _onCreate , version: 1 , onUpgrade:_onUpgrade ) ;  
  return mydb ; 
}

_onUpgrade(Database db , int oldversion , int newversion ) {


 print("onUpgrade =====================================") ; 
  
}

_onCreate(Database db , int version) async {
await db.execute('''
    CREATE TABLE "tips" (
      "main_titel" TEXT NOT NULL PRIMARY KEY,
      "contant" TEXT NOT NULL,
      "read_state" INTEGER NOT NULL
    )
''');


  await db.execute('''
  CREATE TABLE "exrsise" (
    "main_image" TEXT  NOT NULL ,
    "exsrsis_name" TEXT  NOT NULL PRIMARY KEY,
    "count" TEXT  NOT NULL ,
    "explane" TEXT  NOT NULL ,
    "image1" TEXT  NOT NULL  ,
    "image2" TEXT  NOT NULL ,
    "exsrsis_state" INTEGER  NOT NULL   )
 ''') ;
 print(" onCreate =====================================") ; 




  print("onCreate =====================================");
}

readData(String sql) async {
  Database? mydb = await db ; 
  List<Map> response = await  mydb!.rawQuery(sql);
  return response ; 
}
insertData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawInsert(sql);
  return response ; 
}
updateData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawUpdate(sql);
  return response ; 
}
deleteData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawDelete(sql);
  return response ; 
}
 
 deleteallData(sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawDelete(sql);
  return response ; 
}

// SELECT 
// DELETE 
// UPDATE 
// INSERT 
 

}

