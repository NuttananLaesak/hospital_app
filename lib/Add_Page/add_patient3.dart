import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Patient/ct_brain.dart';
import 'package:hospital_app/Add_Patient/disease_selection.dart';
import 'package:hospital_app/Quiz/quiz1_page.dart';

class AddPatient3 extends StatefulWidget {
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

  const AddPatient3({
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
    required this.symptomNeglect,
  });

  @override
  State<AddPatient3> createState() => _AddPatient3State();
}

class _AddPatient3State extends State<AddPatient3> {
  String selectedDiseases = '';
  int? ctBrainScore;
  String? ctBrainText;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'เพิ่มข้อมูลผู้ป่วย',
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
                            setState(() {
                              this.selectedDiseases = selectedDiseases;
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
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Question1Page(
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
                          symptomHead: widget.symptomHead,
                          symptomEye: widget.symptomEye,
                          symptomFace: widget.symptomFace,
                          symptomArm: widget.symptomArm,
                          symptomSpeech: widget.symptomSpeech,
                          symptomVisual: widget.symptomVisual,
                          symptomAphasia: widget.symptomAphasia,
                          symptomNegelct: widget.symptomNeglect,
                          selectedDiseases: selectedDiseases,
                          ctBrain: ctBrainScore,
                          ctBrainText: ctBrainText,
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
                    'ประเมินความรุนเเรง NIHSS',
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
