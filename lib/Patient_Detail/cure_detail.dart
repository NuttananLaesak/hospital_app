import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CureDetial extends StatefulWidget {
  final int patientId;

  const CureDetial({Key? key, required this.patientId}) : super(key: key);

  @override
  State<CureDetial> createState() => _CureDetialState();
}

class _CureDetialState extends State<CureDetial> {
  TextEditingController beforecure = TextEditingController();
  TextEditingController aftercure = TextEditingController();

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
          beforecure.text = _patient?.beforecure ?? '';
          aftercure.text = _patient?.aftercure ?? '';
        });
        break;
      }
    }
  }

  Future<void> _updateCurePatient() async {
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
      beforecure: beforecure.text,
      aftercure: aftercure.text,
      recordedTime1: _patient?.recordedTime1,
      recordedTime2: _patient?.recordedTime2,
      rtpa: _patient?.rtpa ?? '',
    );

    // อัปเดตใน SharedPreferences
    patientList[widget.patientId] = json.encode(updatedPatient.toMap());
    await prefs.setStringList('patients', patientList);
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
            'ผลการรักษา',
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
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.06,
              right: width * 0.06,
              top: height * 0.01,
              bottom: height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Center(
                  child: Text(
                    'ก่อนการรักษา',
                    style: TextStyle(
                        fontSize: height * 0.023, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                cursorColor: const Color(0xFF304FFE),
                controller: beforecure,
                maxLines: null, // Allows the TextField to grow dynamically
                minLines: 5, // Sets a minimum height
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'กรุณาระบุ',
                  alignLabelWithHint: true, // Aligns label to the top
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Color(0xFF304FFE)),
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Center(
                  child: Text(
                    'หลังการรักษา',
                    style: TextStyle(
                        fontSize: height * 0.023, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                cursorColor: const Color(0xFF304FFE),
                controller: aftercure,
                maxLines: null, // Allows the TextField to grow dynamically
                minLines: 5, // Sets a minimum height
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'กรุณาระบุ',
                  alignLabelWithHint: true, // Aligns label to the top
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Color(0xFF304FFE)),
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: height * 0.045),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _updateCurePatient();
                    final snackBar = SnackBar(
                      content: Text(
                        'บันทึกผลการรักษาแล้ว',
                        style: TextStyle(
                          fontSize: height * 0.018, // ขนาดตัวอักษร
                          fontWeight: FontWeight.bold, // ตัวหนา
                          color: Colors.white, // สีตัวอักษร
                        ),
                        textAlign: TextAlign.center, // จัดข้อความตรงกลาง
                      ),
                      backgroundColor:
                          Colors.green.withOpacity(0.8), // พื้นหลังสีเขียวใส
                      duration: Duration(seconds: 1), // ระยะเวลาการแสดงผล
                      behavior:
                          SnackBarBehavior.floating, // ให้ SnackBar ลอยขึ้นมา
                      shape: RoundedRectangleBorder(
                        // ทำมุมโค้งให้ SnackBar
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: height * 0.02), // ขอบห่างจากขอบจอ
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
