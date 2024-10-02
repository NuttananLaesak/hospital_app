import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Patient/ct_brain.dart';
import 'package:hospital_app/Add_Patient/disease_selection.dart';
import 'package:hospital_app/Provider/Paddpatient3.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPatient3 extends StatefulWidget {
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
  final int symptomHead;
  final int symptomEye;
  final int symptomFace;
  final int symptomArm;
  final int symptomSpeech;
  final int symptomVisual;
  final int symptomAphasia;
  final int symptomNeglect;

  const EditPatient3(
      {required this.patientId,
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
      required this.symptomHead,
      required this.symptomEye,
      required this.symptomFace,
      required this.symptomArm,
      required this.symptomSpeech,
      required this.symptomVisual,
      required this.symptomAphasia,
      required this.symptomNeglect});

  @override
  State<EditPatient3> createState() => _EditPatient3State();
}

class _EditPatient3State extends State<EditPatient3> {
  late String initialctselectedDiseases;
  late int initialonDiseasesScore;
  // ignore: unused_field
  String _selectedDiseases = '';
  // ignore: unused_field
  int _onDiseasesScore = -1;
  int? ctBrainScore;
  String? ctBrainText;

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
          _selectedDiseases = patient.selectedDiseases;
          ctBrainScore = patient.ctBrain;
          ctBrainText = patient.ctBrainText;
        });
        break;
      }
    }
  }

  Future<void> _updatePatientData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    // อัปเดตข้อมูลผู้ป่วย
    final updatedPatient = Patient(
      id: widget.patientId,
      nameController: widget.nameController.text,
      hospitalController: widget.hospitalController.text,
      ageController: int.tryParse(widget.ageController.text),
      gender: widget.gender,
      weightController: widget.weightController.text,
      systolicBloodPressureController:
          widget.systolicBloodPressureController.text,
      diastolicBloodPressureController:
          widget.diastolicBloodPressureController.text,
      sugarController: widget.sugarController.text,
      dateTimeController1: widget.dateTimeController1.text,
      dateTimeController2: widget.dateTimeController2.text,
      dateTimeController3: widget.dateTimeController3.text,
      timeDifference1: widget.timeDifference1,
      timeDifference2: widget.timeDifference2,
      symptomHead: widget.symptomHead,
      symptomEye: widget.symptomEye,
      symptomFace: widget.symptomFace,
      symptomArm: widget.symptomArm,
      symptomSpeech: widget.symptomSpeech,
      symptomVisual: widget.symptomVisual,
      symptomAphasia: widget.symptomAphasia,
      symptomNeglect: widget.symptomNeglect,
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
      indications1: _patient?.indications1 ?? 0,
      indications2: _patient?.indications2 ?? 0,
      indications3: _patient?.indications3 ?? 0,
      strictlyprohibited1: _patient?.strictlyprohibited1 ?? 0,
      strictlyprohibited2: _patient?.strictlyprohibited2 ?? 0,
      strictlyprohibited3: _patient?.strictlyprohibited3 ?? 0,
      strictlyprohibited4: _patient?.strictlyprohibited4 ?? 0,
      strictlyprohibited5: _patient?.strictlyprohibited5 ?? 0,
      strictlyprohibited6: _patient?.strictlyprohibited6 ?? 0,
      strictlyprohibited7: _patient?.strictlyprohibited7 ?? 0,
      strictlyprohibited8: _patient?.strictlyprohibited8 ?? 0,
      strictlyprohibited9: _patient?.strictlyprohibited9 ?? 0,
      strictlyprohibited10: _patient?.strictlyprohibited10 ?? 0,
      strictlyprohibited11: _patient?.strictlyprohibited11 ?? 0,
      strictlyprohibited12: _patient?.strictlyprohibited12 ?? 0,
      strictlyprohibited13: _patient?.strictlyprohibited13 ?? 0,
      strictlyprohibited14: _patient?.strictlyprohibited14 ?? 0,
      strictlynotprohibited1: _patient?.strictlynotprohibited1 ?? 0,
      strictlynotprohibited2: _patient?.strictlynotprohibited2 ?? 0,
      strictlynotprohibited3: _patient?.strictlynotprohibited3 ?? 0,
      strictlynotprohibited4: _patient?.strictlynotprohibited4 ?? 0,
      strictlynotprohibited5: _patient?.strictlynotprohibited5 ?? 0,
      strictlynotprohibited6: _patient?.strictlynotprohibited6 ?? 0,
      additionalprohibitions1: _patient?.additionalprohibitions1 ?? 0,
      additionalprohibitions2: _patient?.additionalprohibitions2 ?? 0,
      additionalprohibitions3: _patient?.additionalprohibitions3 ?? 0,
      additionalprohibitions4: _patient?.additionalprohibitions4 ?? 0,
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
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final paddPatient3 = Provider.of<Paddpatient3>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'เเก้ไขข้อมูลผู้ป่วย',
            style: TextStyle(
                fontSize: height * 0.025, fontWeight: FontWeight.bold),
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
                          "โรคประจำตัว",
                          style: TextStyle(
                            fontSize: height * 0.023,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        DiseaseSelection(
                          onDiseasesSelected: (selectedDiseases) {
                            paddPatient3
                                .updateSelectedDiseases(selectedDiseases);
                          },
                          initialValue1: initialctselectedDiseases,
                          onDiseasesScore: (score) {
                            paddPatient3.updateOnDiseasesScore(score);
                          },
                          initialValue2: initialonDiseasesScore,
                        ),
                        SizedBox(height: height * 0.02),
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
                          "เอ็กซเรย์คอมพิวเตอร์สมอง\nCT Brain",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.023,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        ctBrainWidget(
                          context: context,
                          ctBrainScore: ctBrainScore,
                          ctBrainText: ctBrainText,
                          onChanged: (int? newScore, String? newText) {
                            setState(() {
                              ctBrainScore = newScore;
                              ctBrainText = newText;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updatePatientData();
                    loadPatientData();
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
