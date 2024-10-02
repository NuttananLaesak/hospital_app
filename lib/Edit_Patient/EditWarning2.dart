import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions1.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions2.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited1.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited2.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited3.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited4.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited5.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited6.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditWarning2 extends StatefulWidget {
  final int patientId;
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
  final int strictlyprohibited12;
  final int strictlyprohibited13;
  final int strictlyprohibited14;

  const EditWarning2({
    super.key,
    required this.patientId,
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
    required this.strictlyprohibited12,
    required this.strictlyprohibited13,
    required this.strictlyprohibited14,
  });

  @override
  State<EditWarning2> createState() => _EditWarning2State();
}

class _EditWarning2State extends State<EditWarning2> {
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
  // ignore: unused_field
  Patient? _patient;
  @override
  void initState() {
    super.initState();
    loadPatientData();
  }

  Future<void> loadPatientData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    for (var patientData in patientList) {
      Map<String, dynamic> map = Map.from(json.decode(patientData));
      Patient patient = Patient.fromMap(map);
      if (patient.id == widget.patientId) {
        setState(() {
          _patient = patient;
          _totalScore = patient.totalScore;
          _age2 = patient.ageController ?? 0;
        });
        break;
      }
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
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    // อัปเดตข้อมูลผู้ป่วย
    final updatedPatient = Patient(
      id: widget.patientId,
      nameController: _patient?.nameController ?? '',
      hospitalController: _patient?.hospitalController ?? '',
      ageController: _patient?.ageController,
      gender: _patient?.gender ?? '',
      weightController: _patient?.weightController ?? '',
      systolicBloodPressureController:
          _patient?.systolicBloodPressureController ?? '',
      diastolicBloodPressureController:
          _patient?.diastolicBloodPressureController ?? '',
      sugarController: _patient?.sugarController ?? '',
      dateTimeController1: _patient?.dateTimeController1 ?? '',
      dateTimeController2: _patient?.dateTimeController2 ?? '',
      dateTimeController3: _patient?.dateTimeController3 ?? '',
      timeDifference1: _patient?.timeDifference1,
      timeDifference2: _patient?.timeDifference2,
      symptomHead: _patient?.symptomHead ?? 0,
      symptomEye: _patient?.symptomEye ?? 0,
      symptomFace: _patient?.symptomFace ?? 0,
      symptomArm: _patient?.symptomArm ?? 0,
      symptomSpeech: _patient?.symptomSpeech ?? 0,
      symptomVisual: _patient?.symptomVisual ?? 0,
      symptomAphasia: _patient?.symptomAphasia ?? 0,
      symptomNeglect: _patient?.symptomNeglect ?? 0,
      selectedDiseases: _patient?.selectedDiseases ?? '',
      scoreDiseases: _patient?.scoreDiseases ?? 0,
      ctBrain: _patient?.ctBrain,
      ctBrainText: _patient?.ctBrainText,
      totalScore: _patient?.totalScore ?? 0,
      selectedScore1: _patient?.selectedScore1 ?? 0,
      selectedScore2: _patient?.selectedScore2 ?? 0,
      selectedScore3: _patient?.selectedScore3 ?? 0,
      selectedScore4: _patient?.selectedScore4 ?? 0,
      selectedScore5: _patient?.selectedScore5 ?? 0,
      selectedScore6: _patient?.selectedScore6 ?? 0,
      selectedScore7: _patient?.selectedScore7 ?? 0,
      selectedScore8: _patient?.selectedScore8 ?? 0,
      selectedScore9: _patient?.selectedScore9 ?? 0,
      selectedScore10: _patient?.selectedScore10 ?? 0,
      selectedScore11: _patient?.selectedScore11 ?? 0,
      selectedScore12: _patient?.selectedScore12 ?? 0,
      selectedScore13: _patient?.selectedScore13 ?? 0,
      selectedScore14: _patient?.selectedScore14 ?? 0,
      selectedScore15: _patient?.selectedScore15 ?? 0,
      selectedText1: _patient?.selectedText1 ?? '',
      selectedText2: _patient?.selectedText2 ?? '',
      selectedText3: _patient?.selectedText3 ?? '',
      selectedText4: _patient?.selectedText4 ?? '',
      selectedText5: _patient?.selectedText5 ?? '',
      selectedText6: _patient?.selectedText6 ?? '',
      selectedText7: _patient?.selectedText7 ?? '',
      selectedText8: _patient?.selectedText8 ?? '',
      selectedText9: _patient?.selectedText9 ?? '',
      selectedText10: _patient?.selectedText10 ?? '',
      selectedText11: _patient?.selectedText11 ?? '',
      selectedText12: _patient?.selectedText12 ?? '',
      selectedText13: _patient?.selectedText13 ?? '',
      selectedText14: _patient?.selectedText14 ?? '',
      selectedText15: _patient?.selectedText15 ?? '',
      nihssLevel: _patient?.nihssLevel ?? '',
      indications1: widget.indications1,
      indications2: widget.indications2,
      indications3: widget.indications2,
      strictlyprohibited1: widget.strictlyprohibited1,
      strictlyprohibited2: widget.strictlyprohibited2,
      strictlyprohibited3: widget.strictlyprohibited3,
      strictlyprohibited4: widget.strictlyprohibited4,
      strictlyprohibited5: widget.strictlyprohibited5,
      strictlyprohibited6: widget.strictlyprohibited6,
      strictlyprohibited7: widget.strictlyprohibited7,
      strictlyprohibited8: widget.strictlyprohibited8,
      strictlyprohibited9: widget.strictlyprohibited9,
      strictlyprohibited10: widget.strictlyprohibited10,
      strictlyprohibited11: widget.strictlyprohibited11,
      strictlyprohibited12: widget.strictlyprohibited12,
      strictlyprohibited13: widget.strictlyprohibited13,
      strictlyprohibited14: widget.strictlyprohibited14,
      strictlynotprohibited1: strictlynotprohibited1,
      strictlynotprohibited2: strictlynotprohibited2,
      strictlynotprohibited3: strictlynotprohibited3,
      strictlynotprohibited4: strictlynotprohibited4,
      strictlynotprohibited5: strictlynotprohibited5,
      strictlynotprohibited6: strictlynotprohibited6,
      additionalprohibitions1: additionalprohibitions1,
      additionalprohibitions2: additionalprohibitions2,
      additionalprohibitions3: additionalprohibitions3,
      additionalprohibitions4: additionalprohibitions4,
      medic1: _patient?.medic1 ?? 0,
      medic2: _patient?.medic2 ?? 0,
      medic3: _patient?.medic3 ?? 0,
      beforecure: _patient?.beforecure ?? '',
      aftercure: _patient?.aftercure ?? '',
      recordedTime1: _patient?.recordedTime1,
      recordedTime2: _patient?.recordedTime2,
    );

    // อัปเดตใน SharedPreferences
    patientList[widget.patientId] = json.encode(updatedPatient.toMap());
    await prefs.setStringList('patients', patientList);

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
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited2(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        AdditionalProhibitions2(
                          onChanged: (value) {
                            setState(() {
                              additionalprohibitions2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
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
