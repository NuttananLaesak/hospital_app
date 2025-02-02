import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/AdditionalProhibitions_Edit/Edit_AdditionalProhibitions1.dart';
import 'package:hospital_app/AdditionalProhibitions_Edit/Edit_AdditionalProhibitions2.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyNotProhibited1.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyNotProhibited2.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyNotProhibited3.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyNotProhibited4.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyNotProhibited5.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyNotProhibited6.dart';
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
  int additionalprohibitions1 = -1;
  int additionalprohibitions2 = -1;
  int additionalprohibitions3 = -1;
  int additionalprohibitions4 = -1;
  String rtpa = '';

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
          strictlynotprohibited1 = patient.strictlynotprohibited1;
          strictlynotprohibited2 = patient.strictlynotprohibited2;
          strictlynotprohibited3 = patient.strictlynotprohibited3;
          strictlynotprohibited4 = patient.strictlynotprohibited4;
          strictlynotprohibited5 = patient.strictlynotprohibited5;
          strictlynotprohibited6 = patient.strictlynotprohibited6;
          additionalprohibitions1 = patient.additionalprohibitions1;
          additionalprohibitions2 = patient.additionalprohibitions2;
          additionalprohibitions3 = patient.additionalprohibitions3;
          additionalprohibitions4 = patient.additionalprohibitions4;
        });
        break;
      }
    }
  }

  void _checkcalculateWeight() {
    bool indicationsValid1 = (widget.indications1 == 0 &&
        widget.indications2 == 0 &&
        widget.indications3 == 0);
    bool strictlyProhibitedValid1 = widget.strictlyprohibited1 == 0 ||
        widget.strictlyprohibited2 == 0 ||
        widget.strictlyprohibited3 == 0 ||
        widget.strictlyprohibited4 == 0 ||
        widget.strictlyprohibited5 == 0 ||
        widget.strictlyprohibited6 == 0 ||
        widget.strictlyprohibited7 == 0 ||
        widget.strictlyprohibited8 == 0 ||
        widget.strictlyprohibited9 == 0 ||
        widget.strictlyprohibited10 == 0 ||
        widget.strictlyprohibited11 == 0 ||
        widget.strictlyprohibited12 == 0 ||
        widget.strictlyprohibited13 == 0 ||
        widget.strictlyprohibited14 == 0;
    bool strictlyNotProhibitedValid1 = strictlynotprohibited1 == 0 ||
        strictlynotprohibited2 == 0 ||
        strictlynotprohibited3 == 0 ||
        strictlynotprohibited4 == 0 ||
        strictlynotprohibited5 == 0 ||
        strictlynotprohibited6 == 0 ||
        additionalprohibitions1 == 0 ||
        additionalprohibitions2 == 0;

    if (indicationsValid1 &&
        strictlyProhibitedValid1 &&
        (strictlyNotProhibitedValid1)) {
      setState(() {
        rtpa = 'ให้ยาไม่ได้';
      });
    } else if (widget.indications1 == 1 &&
        widget.indications2 == 1 &&
        widget.indications3 == 1 &&
        widget.strictlyprohibited1 == 1 &&
        widget.strictlyprohibited2 == 1 &&
        widget.strictlyprohibited3 == 1 &&
        widget.strictlyprohibited4 == 1 &&
        widget.strictlyprohibited5 == 1 &&
        widget.strictlyprohibited6 == 1 &&
        widget.strictlyprohibited7 == 1 &&
        widget.strictlyprohibited8 == 1 &&
        widget.strictlyprohibited9 == 1 &&
        widget.strictlyprohibited10 == 1 &&
        widget.strictlyprohibited11 == 1 &&
        widget.strictlyprohibited12 == 1 &&
        widget.strictlyprohibited13 == 1 &&
        widget.strictlyprohibited14 == 1 &&
        (strictlyNotProhibitedValid1)) {
      setState(() {
        rtpa = 'อาจจะให้ยาได้';
      });
    } else if (widget.indications1 == 1 &&
        widget.indications2 == 1 &&
        widget.indications3 == 1 &&
        widget.strictlyprohibited1 == 1 &&
        widget.strictlyprohibited2 == 1 &&
        widget.strictlyprohibited3 == 1 &&
        widget.strictlyprohibited4 == 1 &&
        widget.strictlyprohibited5 == 1 &&
        widget.strictlyprohibited6 == 1 &&
        widget.strictlyprohibited7 == 1 &&
        widget.strictlyprohibited8 == 1 &&
        widget.strictlyprohibited9 == 1 &&
        widget.strictlyprohibited10 == 1 &&
        widget.strictlyprohibited11 == 1 &&
        widget.strictlyprohibited12 == 1 &&
        widget.strictlyprohibited13 == 1 &&
        widget.strictlyprohibited14 == 1 &&
        strictlynotprohibited1 == 1 &&
        strictlynotprohibited2 == 1 &&
        strictlynotprohibited3 == 1 &&
        strictlynotprohibited4 == 1 &&
        strictlynotprohibited5 == 1 &&
        strictlynotprohibited6 == 1 &&
        additionalprohibitions1 == 1 &&
        additionalprohibitions2 == 1) {
      setState(() {
        rtpa = 'ให้ยาได้';
      });
    } else if (widget.indications1 == -1 ||
        widget.indications2 == -1 ||
        widget.indications3 == -1 ||
        widget.strictlyprohibited1 == -1 ||
        widget.strictlyprohibited2 == -1 ||
        widget.strictlyprohibited3 == -1 ||
        widget.strictlyprohibited4 == -1 ||
        widget.strictlyprohibited5 == -1 ||
        widget.strictlyprohibited6 == -1 ||
        widget.strictlyprohibited7 == -1 ||
        widget.strictlyprohibited8 == -1 ||
        widget.strictlyprohibited9 == -1 ||
        widget.strictlyprohibited10 == -1 ||
        widget.strictlyprohibited11 == -1 ||
        widget.strictlyprohibited12 == -1 ||
        widget.strictlyprohibited13 == -1 ||
        widget.strictlyprohibited14 == -1 ||
        strictlynotprohibited1 == -1 ||
        strictlynotprohibited2 == -1 ||
        strictlynotprohibited3 == -1 ||
        strictlynotprohibited4 == -1 ||
        strictlynotprohibited5 == -1 ||
        strictlynotprohibited6 == -1 ||
        additionalprohibitions1 == -1 ||
        additionalprohibitions2 == -1) {
      setState(() {
        rtpa = 'ระบุไม่ครบ';
      });
    } else {
      setState(() {
        rtpa = 'ไม่ตรงตามเงื่อนไข';
      });
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
      rtpa: rtpa,
    );

    // อัปเดตใน SharedPreferences
    patientList[widget.patientId] = json.encode(updatedPatient.toMap());
    await prefs.setStringList('patients', patientList);

    Navigator.pop(context);
    Navigator.pop(context);
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
                        EditStrictlyNotProhibited1(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited1 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictlyNotProhibited3(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictlyNotProhibited4(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited4 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictlyNotProhibited5(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited5 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictlyNotProhibited6(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited6 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictlyNotProhibited2(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditAdditionalProhibitions2(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              additionalprohibitions2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditAdditionalProhibitions1(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              additionalprohibitions1 = value;
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
                    _checkcalculateWeight();
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
