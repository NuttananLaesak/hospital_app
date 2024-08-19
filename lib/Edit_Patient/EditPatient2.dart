import 'package:flutter/material.dart';
import 'package:hospital_app/Edit_Patient/EditPatient3.dart';
import 'package:hospital_app/Symptom_Patient/symptom_aphasia.dart';
import 'package:hospital_app/Symptom_Patient/symptom_arm.dart';
import 'package:hospital_app/Symptom_Patient/symptom_eye.dart';
import 'package:hospital_app/Symptom_Patient/symptom_face.dart';
import 'package:hospital_app/Symptom_Patient/symptom_head.dart';
import 'package:hospital_app/Symptom_Patient/symptom_negelct.dart';
import 'package:hospital_app/Symptom_Patient/symptom_speech.dart';
import 'package:hospital_app/Symptom_Patient/symptom_visual.dart';
import 'package:hospital_app/sql_lite.dart';

class EditPatient2 extends StatefulWidget {
  final int patientID;
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
    required this.patientID,
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
  final SqllLiteManage _databaseManager = SqllLiteManage();
  int _symptomHead = 0;
  int _symptomEye = 0;
  int _symptomFace = 0;
  int _symptomArm = 0;
  int _symptomSpeech = 0;
  int _symptomVisual = 0;
  int _symptomAphasia = 0;
  int _symptomNeglect = 0;

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
        _symptomHead = result.first['SymptomHead'];
        _symptomEye = result.first['SymptomEye'];
        _symptomFace = result.first['SymptomFace'];
        _symptomArm = result.first['SymptomArm'];
        _symptomSpeech = result.first['SymptomSpeech'];
        _symptomVisual = result.first['SymptomVisual'];
        _symptomAphasia = result.first['SymptomAphasia'];
        _symptomNeglect = result.first['SymptomNeglect'];
      });
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
                        SymptomHead(
                          onChanged: (value) {
                            setState(() {
                              _symptomHead = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomEye(
                          onChanged: (value) {
                            setState(() {
                              _symptomEye = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomFace(
                          onChanged: (value) {
                            setState(() {
                              _symptomFace = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomArm(
                          onChanged: (value) {
                            setState(() {
                              _symptomArm = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomSpeech(
                          onChanged: (value) {
                            setState(() {
                              _symptomSpeech = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomVisual(
                          onChanged: (value) {
                            setState(() {
                              _symptomVisual = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomAphasia(
                          onChanged: (value) {
                            setState(() {
                              _symptomAphasia = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomNegelct(
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
                      patientID: widget.patientID,
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
