import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/Edit_Patient/EditPatient3.dart';
import 'package:hospital_app/Symptom_Edit/symptom_aphasia_edit.dart';
import 'package:hospital_app/Symptom_Edit/symptom_arm_edit.dart';
import 'package:hospital_app/Symptom_Edit/symptom_eye_edit.dart';
import 'package:hospital_app/Symptom_Edit/symptom_face_edit.dart';
import 'package:hospital_app/Symptom_Edit/symptom_head_edit.dart';
import 'package:hospital_app/Symptom_Edit/symptom_negelct_edit.dart';
import 'package:hospital_app/Symptom_Edit/symptom_speech_edit.dart';
import 'package:hospital_app/Symptom_Edit/symptom_visual_edit.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPatient2 extends StatefulWidget {
  final int patientId;
  final TextEditingController nameController;
  final TextEditingController hospitalController;
  final TextEditingController ageController;
  final String gender;
  final TextEditingController weightController;
  final TextEditingController systolicBloodPressureController;
  final TextEditingController diastolicBloodPressureController;
  final TextEditingController sugarController;
  final TextEditingController dateTimeController1;
  final TextEditingController dateTimeController2;
  final TextEditingController dateTimeController3;
  final double? timeDifference1;
  final double? timeDifference2;

  const EditPatient2({
    required this.patientId,
    required this.nameController,
    required this.hospitalController,
    required this.ageController,
    required this.gender,
    required this.weightController,
    required this.systolicBloodPressureController,
    required this.diastolicBloodPressureController,
    required this.sugarController,
    required this.dateTimeController1,
    required this.dateTimeController2,
    required this.dateTimeController3,
    required this.timeDifference1,
    required this.timeDifference2,
  });

  @override
  State<EditPatient2> createState() => _EditPatient2State();
}

class _EditPatient2State extends State<EditPatient2> {
  int _symptomHead = 0;
  int _symptomEye = 0;
  int _symptomFace = 0;
  int _symptomArm = 0;
  int _symptomSpeech = 0;
  int _symptomVisual = 0;
  int _symptomAphasia = 0;
  int _symptomNeglect = 0;

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
          _symptomHead = patient.symptomHead;
          _symptomEye = patient.symptomEye;
          _symptomFace = patient.symptomFace;
          _symptomArm = patient.symptomArm;
          _symptomSpeech = patient.symptomSpeech;
          _symptomVisual = patient.symptomVisual;
          _symptomAphasia = patient.symptomAphasia;
          _symptomNeglect = patient.symptomNeglect;
        });
        break;
      }
    }
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
          automaticallyImplyLeading: true,
          title: Text(
            'เเก้ไขข้อมูลผู้ป่วย',
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
                          "อาการของผู้ป่วย",
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomHeadEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomHead = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomEyeEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomEye = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomFaceEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomFace = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomArmEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomArm = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomSpeechEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomSpeech = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomVisualEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomVisual = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomAphasiaEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomAphasia = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomNegelctEdit(
                          onChanged: (value) {
                            setState(() {
                              _symptomNeglect = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPatient3(
                      patientId: widget.patientId,
                      nameController: widget.nameController,
                      hospitalController: widget.hospitalController,
                      ageController: widget.ageController,
                      gender: widget.gender,
                      weightController: widget.weightController,
                      systolicBloodPressureController:
                          widget.systolicBloodPressureController,
                      diastolicBloodPressureController:
                          widget.diastolicBloodPressureController,
                      sugarController: widget.sugarController,
                      dateTimeController1: widget.dateTimeController1,
                      dateTimeController2: widget.dateTimeController2,
                      dateTimeController3: widget.dateTimeController3,
                      timeDifference1: widget.timeDifference1,
                      timeDifference2: widget.timeDifference2,
                      symptomHead: _symptomHead,
                      symptomEye: _symptomEye,
                      symptomFace: _symptomFace,
                      symptomArm: _symptomArm,
                      symptomSpeech: _symptomSpeech,
                      symptomVisual: _symptomVisual,
                      symptomAphasia: _symptomAphasia,
                      symptomNeglect: _symptomNeglect,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF82B1FF)),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(150, 70)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
              child: Text(
                'หน้าถัดไป',
                style: TextStyle(
                  fontSize: height * 0.022,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.025),
          ],
        ),
      ),
    );
  }
}
