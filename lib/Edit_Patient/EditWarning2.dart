import 'package:flutter/material.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions1.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions2.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions3.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions4.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited1.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited2.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited3.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited4.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited5.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited6.dart';
import 'package:hospital_app/sql_lite.dart';

class EditWarning2 extends StatefulWidget {
  final int patientID;
  final int indications1;
  final int indications2;
  final int indications3;
  final int strictlyprohibited1;
  final int strictlyprohibited2;
  final int strictlyprohibited3;
  final int strictlyprohibited4;
  final int strictlyprohibited5;
  final int strictlyprohibited6;
  final int strictlyprohibited7;
  final int strictlyprohibited8;
  final int strictlyprohibited9;
  final int strictlyprohibited10;
  final int strictlyprohibited11;

  const EditWarning2({
    super.key,
    required this.patientID,
    required this.indications1,
    required this.indications2,
    required this.indications3,
    required this.strictlyprohibited1,
    required this.strictlyprohibited2,
    required this.strictlyprohibited3,
    required this.strictlyprohibited4,
    required this.strictlyprohibited5,
    required this.strictlyprohibited6,
    required this.strictlyprohibited7,
    required this.strictlyprohibited8,
    required this.strictlyprohibited9,
    required this.strictlyprohibited10,
    required this.strictlyprohibited11,
  });

  @override
  State<EditWarning2> createState() => _EditWarning2State();
}

class _EditWarning2State extends State<EditWarning2> {
  final SqllLiteManage _databaseManager = SqllLiteManage();
  int strictlynotprohibited1 = -1;
  int strictlynotprohibited2 = -1;
  int strictlynotprohibited3 = -1;
  int strictlynotprohibited4 = -1;
  int strictlynotprohibited5 = -1;
  int strictlynotprohibited6 = -1;
  late bool nihssLess = false;
  late bool nihssMore = false;
  int additionalprohibitions1 = -1;
  int additionalprohibitions2 = -1;
  late bool age2Less = false;
  late bool age2sMore = false;
  int additionalprohibitions3 = -1;
  int additionalprohibitions4 = -1;
  int _totalScore = 0;
  int _age2 = 0;

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    await _databaseManager.openOrCreateDatabase();
    List<Map<String, dynamic>> result = await _databaseManager.selectDatabase(
      "SELECT * FROM Patient WHERE ID = ${widget.patientID}",
    );

    if (result.isNotEmpty) {
      setState(() {
        _totalScore = result.first['TotalScore'];
        _age2 = result.first['Age'];
      });
      _initializeAdditionalProhibitions();
    }
  }

  void _initializeAdditionalProhibitions() {
    int scorenihss = _totalScore;
    if (scorenihss == 0) {
      additionalprohibitions1 = -1;
      nihssLess = false;
      nihssMore = false;
    } else {
      nihssLess = scorenihss <= 24;
      nihssMore = scorenihss >= 25;
      additionalprohibitions1 = nihssLess ? 1 : 0;
    }
    int age2 = _age2;
    if (age2 == 0) {
      additionalprohibitions3 = -1;
      age2Less = false;
      age2sMore = false;
    } else {
      age2Less = age2 <= 79;
      age2sMore = age2 >= 80;
      additionalprohibitions3 = age2Less ? 1 : 0;
    }
  }

  Future<void> _updateWarning() async {
    String updateQuery = "UPDATE Patient SET "
        "Indications1 = ${widget.indications1}, "
        "Indications2 = ${widget.indications2}, "
        "Indications3 = ${widget.indications3}, "
        "StrictlyProhibited1 = ${widget.strictlyprohibited1}, "
        "StrictlyProhibited2 = ${widget.strictlyprohibited2}, "
        "StrictlyProhibited3 = ${widget.strictlyprohibited3}, "
        "StrictlyProhibited4 = ${widget.strictlyprohibited4}, "
        "StrictlyProhibited5 = ${widget.strictlyprohibited5}, "
        "StrictlyProhibited6 = ${widget.strictlyprohibited6}, "
        "StrictlyProhibited7 = ${widget.strictlyprohibited7}, "
        "StrictlyProhibited8 = ${widget.strictlyprohibited8}, "
        "StrictlyProhibited9 = ${widget.strictlyprohibited9}, "
        "StrictlyProhibited10 = ${widget.strictlyprohibited10}, "
        "StrictlyProhibited11 = ${widget.strictlyprohibited11}, "
        "StrictlyNotProhibited1 = ${strictlynotprohibited1}, "
        "StrictlyNotProhibited2 = ${strictlynotprohibited2}, "
        "StrictlyNotProhibited3 = ${strictlynotprohibited3}, "
        "StrictlyNotProhibited4 = ${strictlynotprohibited4}, "
        "StrictlyNotProhibited5 = ${strictlynotprohibited5}, "
        "StrictlyNotProhibited6 = ${strictlynotprohibited6}, "
        "AdditionalProhibitions1 = ${additionalprohibitions1}, "
        "AdditionalProhibitions2 = ${additionalprohibitions2}, "
        "AdditionalProhibitions3 = ${additionalprohibitions3}, "
        "AdditionalProhibitions4 = ${additionalprohibitions4} "
        "WHERE ID = ${widget.patientID}";

    await _databaseManager.updateDatabase(updateQuery);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void updateAdditionalProhibitions1(bool? value, bool isnihssLess) {
    setState(() {
      if (isnihssLess) {
        nihssLess = value ?? false;
        nihssMore = !nihssLess;
      } else {
        nihssMore = value ?? false;
        nihssLess = !nihssMore;
      }
      additionalprohibitions1 = nihssLess ? 1 : 0;
    });
  }

  void updateAdditionalProhibitions3(bool? value, bool isage2Less) {
    setState(() {
      if (isage2Less) {
        age2Less = value ?? false;
        age2sMore = !age2Less;
      } else {
        age2sMore = value ?? false;
        age2Less = !age2sMore;
      }
      additionalprohibitions3 = age2Less ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ข้อห้าม/ข้อบ่งชี้',
            style: TextStyle(
                fontSize: height * 0.026, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.03),
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 192, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'ข้อห้ามที่ไม่ถือว่า\nห้ามอย่างเด็ดขาด',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.04),
                        StrictlyNotProhibited1(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited1 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited2(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited3(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited4(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited4 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited5(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited5 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited6(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited6 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 192, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          "ข้อห้ามเพิ่มเติมกรณีให้ยาใน\nผู้ป่วยที่มีอาการมากกว่า 4.5 ชั่วโมง",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.023,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        AdditionalProhibitions1(
                          nihssLess: nihssLess,
                          nihssMore: nihssMore,
                          nihssLessChanged: (value) =>
                              updateAdditionalProhibitions1(value, true),
                          nihssMoreChanged: (value) =>
                              updateAdditionalProhibitions1(value, false),
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 192, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          "ข้อห้ามเพิ่มเติมกรณีให้ยาใน\nผู้ป่วยที่มีอาการมากกว่า 4.5 ชั่วโมง",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.023,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        AdditionalProhibitions2(
                          onChanged: (value) {
                            setState(() {
                              additionalprohibitions2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        AdditionalProhibitions3(
                          age2Less: age2Less,
                          age2sMore: age2sMore,
                          age2LessChanged: (value) =>
                              updateAdditionalProhibitions3(value, true),
                          age2MoreChanged: (value) =>
                              updateAdditionalProhibitions3(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        AdditionalProhibitions4(
                          onChanged: (value) {
                            setState(() {
                              additionalprohibitions4 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updateWarning();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF82B1FF)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(150, 70)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'บันทึก',
                    style: TextStyle(
                      fontSize: height * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
