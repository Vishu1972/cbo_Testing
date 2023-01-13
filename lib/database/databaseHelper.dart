import 'dart:developer';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "cbo_test";
  static const _databaseVersion = 1;

  static const EMPLOYEE_TABLE = "employee";

  static Database? _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance =  DatabaseHelper._privateConstructor();

  factory DatabaseHelper() => instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);

    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute('''DROP TABLE IF EXISTS $EMPLOYEE_TABLE''');
    await db.execute('''
        CREATE TABLE $EMPLOYEE_TABLE(
          empCode INTEGER PRIMARY KEY,
          empName VARCHAR(80),
          empMobile INTEGER,
          empDOB VARCHAR(100),
          dateofjoining VARCHAR(100),
          salary int,
          address VARCHAR(255),
          remarks TEXT
        );
    ''');
  }

  Future getEmployeeSingleRecord() async {
    Database db = await instance.database;
    var empCodeExist = await db.rawQuery("SELECT empCode FROM $EMPLOYEE_TABLE WHERE empCode = 1123");

    log("EmployeeRecord===$empCodeExist");
    log("EmployeeRecordDataType===${empCodeExist.runtimeType}");
    log("EmployeeRecordLength===${empCodeExist.toList().length}");
  }

  Future insertEmployeeRecord({empCode, empName, empMobile, empDOB,  dateofjoining, salary, address, remarks}) async {
    var result;
    try{
      Database db = await instance.database;

      var empCodeExist = await db.rawQuery("SELECT empCode FROM $EMPLOYEE_TABLE WHERE empCode = $empCode");
      if(empCodeExist.toList().isNotEmpty) {
        return 0;
      } else {
        result = db.rawInsert("INSERT INTO $EMPLOYEE_TABLE(empCode, empName, empMobile, empDOB, dateofjoining, salary, address, remarks) "
            " VALUES('$empCode', '$empName','$empMobile','$empDOB','$dateofjoining','$salary','$address','$remarks')");
      }
    }catch(e){
      log("StackTrace===$e");
    }

    return result;
  }

  Future getEmployeeRecord() async {
    var result;
    try{
      Database db = await instance.database;

      result = db.query(EMPLOYEE_TABLE);
    }catch(e){
      log("StackTrace===$e");
    }

    return result;
  }

  Future deleteEmployeeRecord(empCode)  async {
    var result;
    try{
      Database db = await instance.database;

      result = await db.delete(EMPLOYEE_TABLE, where: "empCode = ?", whereArgs: [empCode]);
    }catch(e){
      log("StackTrace===$e");
    }

    return result;
  }
}