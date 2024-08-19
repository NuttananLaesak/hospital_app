import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqllLiteManage {
  final String _databaseName = "PatientData.db";
  final int _databaseVersion = 2;

  final String _createSQL = "CREATE TABLE Patient ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "PatientName TEXT,"
      "Hospital TEXT,"
      "Age INTEGER,"
      "Gender TEXT,"
      "Weight TEXT,"
      "SystolicBloodPressure TEXT,"
      "DiastolicBloodPressure TEXT,"
      "Sugar TEXT,"
      "DateTime1 TEXT,"
      "DateTime2 TEXT,"
      "DateTime3 TEXT,"
      "SymptomHead INTEGER,"
      "SymptomEye INTEGER,"
      "SymptomFace INTEGER,"
      "SymptomArm INTEGER,"
      "SymptomSpeech INTEGER,"
      "SymptomVisual INTEGER,"
      "SymptomAphasia INTEGER,"
      "SymptomNeglect INTEGER,"
      "SelectedDiseases TEXT,"
      "CTBrain INTEGER,"
      "TotalScore INTEGER,"
      "SelectedScore1 INTEGER,"
      "SelectedText1 TEXT,"
      "SelectedScore2 INTEGER,"
      "SelectedText2 TEXT,"
      "SelectedScore3 INTEGER,"
      "SelectedText3 TEXT,"
      "SelectedScore4 INTEGER,"
      "SelectedText4 TEXT,"
      "SelectedScore5 INTEGER,"
      "SelectedText5 TEXT,"
      "SelectedScore6 INTEGER,"
      "SelectedText6 TEXT,"
      "SelectedScore7 INTEGER,"
      "SelectedText7 TEXT,"
      "SelectedScore8 INTEGER,"
      "SelectedText8 TEXT,"
      "SelectedScore9 INTEGER,"
      "SelectedText9 TEXT,"
      "SelectedScore10 INTEGER,"
      "SelectedText10 TEXT,"
      "SelectedScore11 INTEGER,"
      "SelectedText11 TEXT,"
      "SelectedScore12 INTEGER,"
      "SelectedText12 TEXT,"
      "SelectedScore13 INTEGER,"
      "SelectedText13 TEXT,"
      "SelectedScore14 INTEGER,"
      "SelectedText14 TEXT,"
      "SelectedScore15 INTEGER,"
      "SelectedText15 TEXT,"
      "NIHSSLevel TEXT,"
      "Indications1 INTEGER,"
      "Indications2 INTEGER,"
      "Indications3 INTEGER,"
      "StrictlyProhibited1 INTEGER,"
      "StrictlyProhibited2 INTEGER,"
      "StrictlyProhibited3 INTEGER,"
      "StrictlyProhibited4 INTEGER,"
      "StrictlyProhibited5 INTEGER,"
      "StrictlyProhibited6 INTEGER,"
      "StrictlyProhibited7 INTEGER,"
      "StrictlyProhibited8 INTEGER,"
      "StrictlyProhibited9 INTEGER,"
      "StrictlyProhibited10 INTEGER,"
      "StrictlyProhibited11 INTEGER,"
      "StrictlyNotProhibited1 INTEGER,"
      "StrictlyNotProhibited2 INTEGER,"
      "StrictlyNotProhibited3 INTEGER,"
      "StrictlyNotProhibited4 INTEGER,"
      "StrictlyNotProhibited5 INTEGER,"
      "StrictlyNotProhibited6 INTEGER,"
      "AdditionalProhibitions1 INTEGER,"
      "AdditionalProhibitions2 INTEGER,"
      "AdditionalProhibitions3 INTEGER,"
      "AdditionalProhibitions4 INTEGER,"
      "TimeDifference1 REAL,"
      "TimeDifference2 REAL,"
      "Medic1 REAL,"
      "Medic2 REAL,"
      "Medic3 REAL,"
      "BeforeCure TEXT,"
      "AfterCure TEXT,"
      "CTBrainText TEXT"
      ");";

  String createSqlCommand = '';
  String databasePath = '';
  String dbPath = '';
  Database? _database;

  Future<void> openOrCreateDatabase() async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: createDatabase);
  }

  Future<void> createDatabase(Database db, int version) async {
    if (createSqlCommand.isNotEmpty) {
      await db.execute(createSqlCommand);
    }
  }

  Future<List<Map<String, dynamic>>> selectDatabase(String sqlString) async {
    if (_database == null) {
      await openOrCreateDatabase();
    }
    return await _database!.rawQuery(sqlString);
  }

  Future<int> insertDatabase(String sqlString) async {
    if (_database == null) {
      await openOrCreateDatabase();
    }
    return await _database!.rawInsert(sqlString);
  }

  Future<int> updateDatabase(String sqlString) async {
    if (_database == null) {
      await openOrCreateDatabase();
    }
    return await _database!.rawUpdate(sqlString);
  }

  Future<int> deleteDatabase(String sqlString) async {
    if (_database == null) {
      await openOrCreateDatabase();
    }
    return await _database!.rawDelete(sqlString);
  }

  Future<int> deleteRecordById(int id) async {
    if (_database == null) {
      await openOrCreateDatabase();
    }
    return await _database!.delete('Patient', where: 'ID = ?', whereArgs: [id]);
  }
}
