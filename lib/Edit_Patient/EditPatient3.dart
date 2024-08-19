import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Patient/ct_brain.dart';
import 'package:hospital_app/Add_Patient/disease_selection.dart';
import 'package:hospital_app/sql_lite.dart';

class EditPatient3 extends StatefulWidget {
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
  final int symptomHead;
  final int symptomEye;
  final int symptomFace;
  final int symptomArm;
  final int symptomSpeech;
  final int symptomVisual;
  final int symptomAphasia;
  final int symptomNeglect;

  const EditPatient3(
      {required this.patientID,
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
  final SqllLiteManage _databaseManager = SqllLiteManage();
  String _selectedDiseases = '';
  int? ctBrainScore;
  String? ctBrainText;

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
        _selectedDiseases = result.first['SelectedDiseases'];
        ctBrainScore = result.first['CTBrain'];
        ctBrainText = result.first['CTBrainText'];
      });
    }
  }

  Future<void> _updatePatientData() async {
    String updateQuery = "UPDATE Patient SET "
        "PatientName = '${widget.nameController.text}', "
        "Hospital = '${widget.hospitalController.text}', "
        "Age = ${widget.ageController.text}, "
        "Gender = '${widget.gender}', "
        "Weight = '${widget.weightController.text}', "
        "SystolicBloodPressure = '${widget.systolicBloodPressureController.text}', "
        "DiastolicBloodPressure = '${widget.diastolicBloodPressureController.text}', "
        "Sugar = '${widget.sugarController.text}', "
        "DateTime1 = '${widget.dateTimeController1.text}', "
        "DateTime2 = '${widget.dateTimeController2.text}', "
        "DateTime3 = '${widget.dateTimeController3.text}', "
        "TimeDifference1 = ${widget.timeDifference1 ?? 'NULL'}, "
        "TimeDifference2 = ${widget.timeDifference2 ?? 'NULL'}, "
        "SymptomHead = ${widget.symptomHead}, "
        "SymptomEye = ${widget.symptomEye}, "
        "SymptomFace = ${widget.symptomFace}, "
        "SymptomArm = ${widget.symptomArm}, "
        "SymptomSpeech = ${widget.symptomSpeech}, "
        "SymptomVisual = ${widget.symptomVisual}, "
        "SymptomAphasia = ${widget.symptomAphasia}, "
        "SymptomNeglect = ${widget.symptomNeglect}, "
        "SelectedDiseases = '$_selectedDiseases', "
        "CTBrain = ${ctBrainScore ?? 'NULL'}, "
        "CTBrainText = '${ctBrainText ?? 'NULL'}' "
        "WHERE ID = ${widget.patientID}";

    await _databaseManager.updateDatabase(updateQuery);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);

    _loadPatientData();
  }

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
                            setState(() {
                              this._selectedDiseases = selectedDiseases;
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
            SizedBox(height: height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updatePatientData();
                    _loadPatientData();
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
