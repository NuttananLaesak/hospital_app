import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient3.dart';
import 'package:hospital_app/Symptom_Patient/symptom_aphasia.dart';
import 'package:hospital_app/Symptom_Patient/symptom_arm.dart';
import 'package:hospital_app/Symptom_Patient/symptom_eye.dart';
import 'package:hospital_app/Symptom_Patient/symptom_face.dart';
import 'package:hospital_app/Symptom_Patient/symptom_head.dart';
import 'package:hospital_app/Symptom_Patient/symptom_negelct.dart';
import 'package:hospital_app/Symptom_Patient/symptom_speech.dart';
import 'package:hospital_app/Symptom_Patient/symptom_visual.dart';
import 'package:provider/provider.dart';

import '../Provider/Paddpatient2.dart';

class Add_Patient2 extends StatefulWidget {
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

  const Add_Patient2({
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
  State<Add_Patient2> createState() => _Add_Patient2State();
}

class _Add_Patient2State extends State<Add_Patient2> {
  late int initialSymptomHead;
  late int initialSymptomEye;
  late int initialSymptomFace;
  late int initialSymptomArm;
  late int initialSymptomSpeech;
  late int initialSymptomVisual;
  late int initialSymptomAphasia;
  late int initialSymptomNeglect;

  @override
  void initState() {
    super.initState();
    // ดึง paddPatient2 จาก Provider
    final paddPatient2 = Provider.of<Paddpatient2>(context, listen: false);
    // กำหนดค่าครั้งแรกจาก paddPatient2
    initialSymptomHead = paddPatient2.symptomHead;
    initialSymptomEye = paddPatient2.symptomEye;
    initialSymptomFace = paddPatient2.symptomFace;
    initialSymptomArm = paddPatient2.symptomArm;
    initialSymptomSpeech = paddPatient2.symptomSpeech;
    initialSymptomVisual = paddPatient2.symptomVisual;
    initialSymptomAphasia = paddPatient2.symptomAphasia;
    initialSymptomNeglect = paddPatient2.symptomNeglect;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final paddPatient2 = Provider.of<Paddpatient2>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'เพิ่มข้อมูลผู้ป่วย',
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
                              paddPatient2.setSymptomHead(value);
                            });
                          },
                          initialValue1: initialSymptomHead,
                        ),
                        Text(
                          "อาการ Head: ${paddPatient2.symptomHead}",
                          style: TextStyle(fontSize: height * 0.022),
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomEye(
                          onChanged: (value) {
                            setState(() {
                              paddPatient2.setSymptomEye(value);
                            });
                          },
                          initialValue2: initialSymptomEye,
                        ),
                        Text(
                          "อาการ Eye: ${paddPatient2.symptomEye}",
                          style: TextStyle(fontSize: height * 0.022),
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomFace(
                          onChanged: (value) {
                            setState(() {
                              paddPatient2.setSymptomFace(value);
                            });
                          },
                          initialValue3: initialSymptomFace,
                        ),
                        Text(
                          "อาการ Face: ${paddPatient2.symptomFace}",
                          style: TextStyle(fontSize: height * 0.022),
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomArm(
                          onChanged: (value) {
                            setState(() {
                              paddPatient2.setSymptomArm(value);
                            });
                          },
                          initialValue4: initialSymptomArm,
                        ),
                        Text(
                          "อาการ Arm: ${paddPatient2.symptomArm}",
                          style: TextStyle(fontSize: height * 0.022),
                        ),
                        SizedBox(height: height * 0.02),
                        SymptomSpeech(
                          onChanged: (value) {
                            setState(() {
                              paddPatient2.setSymptomSpeech(value);
                            });
                          },
                          initialValue5: initialSymptomSpeech,
                        ),
                        Text(
                          "อาการ Speech: ${paddPatient2.symptomSpeech}",
                          style: TextStyle(fontSize: height * 0.022),
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                        SymptomVisual(
                          onChanged: (value) {
                            setState(() {
                              paddPatient2.setSymptomVisual(value);
                            });
                          },
                          initialValue6: initialSymptomVisual,
                        ),
                        Text(
                          "อาการ Visual: ${paddPatient2.symptomVisual}",
                          style: TextStyle(fontSize: height * 0.022),
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                        SymptomAphasia(
                          onChanged: (value) {
                            setState(() {
                              paddPatient2.setSymptomAphasia(value);
                            });
                          },
                          initialValue7: initialSymptomAphasia,
                        ),
                        Text(
                          "อาการ Aphasia: ${paddPatient2.symptomAphasia}",
                          style: TextStyle(fontSize: height * 0.022),
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                        SymptomNegelct(
                          onChanged: (value) {
                            setState(() {
                              paddPatient2.setSymptomNeglect(value);
                            });
                          },
                          initialValue8: initialSymptomNeglect,
                        ),
                        Text(
                          "อาการ Neglect: ${paddPatient2.symptomNeglect}",
                          style: TextStyle(fontSize: height * 0.022),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPatient3(
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
                        ),
                      ),
                    );
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
                    'หน้าถัดไป',
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
            SizedBox(height: height * 0.025),
          ],
        ),
      ),
    );
  }
}
