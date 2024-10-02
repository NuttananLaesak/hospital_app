import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/Patient_Detail/warning_detail.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MadicDetail extends StatefulWidget {
  final int patientId;

  const MadicDetail({Key? key, required this.patientId}) : super(key: key);

  @override
  State<MadicDetail> createState() => _MadicDetailState();
}

class _MadicDetailState extends State<MadicDetail> {
  int patientWeight = 0;
  double medic1 = 0.0;
  double medic2 = 0.0;
  double medic3 = 0.0;
  bool showMedicationError = false;

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
          patientWeight = int.tryParse(patient.weightController) ?? 0;
        });
        _checkcalculateWeight();
        break;
      }
    }
  }

  void _checkcalculateWeight() {
    if (_patient?.indications1 == 1 &&
        _patient?.indications2 == 1 &&
        _patient?.indications3 == 1 &&
        _patient?.strictlyprohibited1 == 1 &&
        _patient?.strictlyprohibited2 == 1 &&
        _patient?.strictlyprohibited3 == 1 &&
        _patient?.strictlyprohibited4 == 1 &&
        _patient?.strictlyprohibited5 == 1 &&
        _patient?.strictlyprohibited6 == 1 &&
        _patient?.strictlyprohibited7 == 1 &&
        _patient?.strictlyprohibited8 == 1 &&
        _patient?.strictlyprohibited9 == 1 &&
        _patient?.strictlyprohibited10 == 1 &&
        _patient?.strictlyprohibited11 == 1 &&
        _patient?.additionalprohibitions1 == 1) {
      setState(() {
        showMedicationError = false;
      });
    } else {
      setState(() {
        showMedicationError = true;
      });
    }
  }

  void _calculateWeight() {
    setState(() {
      medic1 = patientWeight * 0.9;
      medic2 = medic1 * 0.1;
      medic3 = medic1 - medic2;
    });
  }

  void _navigateToWarningPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WarningDetail(patientId: widget.patientId)),
    ).then((_) {
      loadPatientData();
    });
  }

  Future<void> _updateMadic() async {
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
      medic1: medic1,
      medic2: medic2,
      medic3: medic3,
      beforecure: _patient?.beforecure ?? '',
      aftercure: _patient?.aftercure ?? '',
      recordedTime1: _patient?.recordedTime1,
      recordedTime2: _patient?.recordedTime2,
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
            'ปริมาณยา',
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
          children: [
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.02),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: Color(0xFF82B1FF),
                    width: 5,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.02),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อมูลผู้ป่วย',
                            style: TextStyle(
                                fontSize: height * 0.026,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          Text(
                            'ชื่อ : ${_patient?.nameController}',
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                          Divider(),
                          Text(
                            'โรงพยาบาล : ${_patient?.hospitalController}',
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                          Divider(),
                          Text(
                            'น้ำหนัก : ${_patient?.weightController} กิโลกรัม',
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                          Divider(),
                          SizedBox(height: height * 0.04),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          Text(
                            'การให้ยาผู้ป่วย',
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          if (showMedicationError)
                            Column(
                              children: [
                                Text(
                                  'ไม่สามารถคำนวณยาได้เนื่องจาก\nไม่ผ่านข้อบ่งชี้และข้อห้าม',
                                  style: TextStyle(
                                    fontSize: height * 0.02,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: height * 0.01),
                                ElevatedButton(
                                  onPressed: () {
                                    _navigateToWarningPage();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF82B1FF)),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(width * 0.4, height * 0.05)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'ไปยังหน้าข้อบ่งชี้เเละข้อห้าม',
                                    style: TextStyle(
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              children: [
                                Text(
                                  'ปริมาณยาละลายลิ่มเลือด\n(rt-PA) ${(_patient?.medic1 ?? 0.0).toStringAsFixed(2)} มิลลิกรัม',
                                  style: TextStyle(fontSize: height * 0.02),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                                Text(
                                  'แบ่งให้ ${(_patient?.medic2 ?? 0.0).toStringAsFixed(2)} มิลลิกรัม\nทางหลอดเลือดดำใน 1 นาที',
                                  style: TextStyle(fontSize: height * 0.02),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                                Text(
                                  'และ ${(_patient?.medic3 ?? 0.0).toStringAsFixed(2)} มิลลิกรัม\nหยดทางหลอดเลือดดำใน 60 นาที',
                                  style: TextStyle(fontSize: height * 0.02),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            ElevatedButton(
              onPressed: () {
                _calculateWeight();
                _updateMadic().then((_) {
                  loadPatientData();
                });
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
                'คำนวณยาเเละบันทึก',
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
      ),
    );
  }
}
