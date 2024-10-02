import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hospital_app/Provider/Paddpatient2.dart';
import 'package:hospital_app/Provider/Paddpatient3.dart';
import 'package:hospital_app/Provider/Pquiz.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AddPatient10 extends StatefulWidget {
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

  final String selectedDiseases;
  final int? ctBrain;
  final String? ctBrainText;
  final int totalScore;
  final int selectedScore1;
  final String selectedText1;
  final int selectedScore2;
  final String selectedText2;
  final int selectedScore3;
  final String selectedText3;
  final int selectedScore4;
  final String selectedText4;
  final int selectedScore5;
  final String selectedText5;
  final int selectedScore6;
  final String selectedText6;
  final int selectedScore7;
  final String selectedText7;
  final int selectedScore8;
  final String selectedText8;
  final int selectedScore9;
  final String selectedText9;
  final int selectedScore10;
  final String selectedText10;
  final int selectedScore11;
  final String selectedText11;
  final int selectedScore12;
  final String selectedText12;
  final int selectedScore13;
  final String selectedText13;
  final int selectedScore14;
  final String selectedText14;
  final int selectedScore15;
  final String selectedText15;
  final String nihssLevel;
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
  final int strictlynotprohibited1;
  final int strictlynotprohibited2;
  final int strictlynotprohibited3;
  final int strictlynotprohibited4;
  final int strictlynotprohibited5;
  final int strictlynotprohibited6;
  final int additionalprohibitions1;
  final int additionalprohibitions2;
  final int additionalprohibitions3;
  final int additionalprohibitions4;
  final double medic1;
  final double medic2;
  final double medic3;
  final TextEditingController beforecure;
  final TextEditingController aftercure;

  const AddPatient10(
      {Key? key,
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
      required this.selectedDiseases,
      required this.ctBrain,
      required this.ctBrainText,
      required this.totalScore,
      required this.selectedScore1,
      required this.selectedText1,
      required this.selectedScore2,
      required this.selectedText2,
      required this.selectedScore3,
      required this.selectedText3,
      required this.selectedScore4,
      required this.selectedText4,
      required this.selectedScore5,
      required this.selectedText5,
      required this.selectedScore6,
      required this.selectedText6,
      required this.selectedScore7,
      required this.selectedText7,
      required this.selectedScore8,
      required this.selectedText8,
      required this.selectedScore9,
      required this.selectedText9,
      required this.selectedScore10,
      required this.selectedText10,
      required this.selectedScore11,
      required this.selectedText11,
      required this.selectedScore12,
      required this.selectedText12,
      required this.selectedScore13,
      required this.selectedText13,
      required this.selectedScore14,
      required this.selectedText14,
      required this.selectedScore15,
      required this.selectedText15,
      required this.nihssLevel,
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
      required this.strictlynotprohibited1,
      required this.strictlynotprohibited2,
      required this.strictlynotprohibited3,
      required this.strictlynotprohibited4,
      required this.strictlynotprohibited5,
      required this.strictlynotprohibited6,
      required this.additionalprohibitions1,
      required this.additionalprohibitions2,
      required this.additionalprohibitions3,
      required this.additionalprohibitions4,
      required this.medic1,
      required this.medic2,
      required this.medic3,
      required this.beforecure,
      required this.aftercure})
      : super(key: key);

  @override
  State<AddPatient10> createState() => _AddPatient10State();
}

class _AddPatient10State extends State<AddPatient10> {
  String? recordedTime1; // ตัวแปรสำหรับเก็บเวลา
  String? recordedTime2; // ตัวแปรสำหรับเก็บเวลา

  void _recordTime() {
    // รับเวลาปัจจุบัน
    final now = DateTime.now();

    // แปลงเป็นรูปแบบทศนิยม (ชั่วโมง.นาที)
    String formattedTime = DateFormat('HH:mm').format(now);

    // สร้างข้อความสำหรับวันที่และเวลาที่บันทึก
    recordedTime1 = "${now.day}/${now.month}/${now.year}";
    recordedTime2 = "เวลา ${formattedTime} นาฬิกา";
    setState(() {}); // อัพเดท UI
  }

  Future<void> savePatientData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    int newId = patientList.length;

    final paddPatient2 = Provider.of<Paddpatient2>(context, listen: false);
    final paddPatient3 = Provider.of<Paddpatient3>(context, listen: false);
    final quiz = Provider.of<QuizModel>(context, listen: false);

    Patient patient = Patient(
      id: newId,
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
      symptomHead: paddPatient2.symptomHead,
      symptomEye: paddPatient2.symptomEye,
      symptomFace: paddPatient2.symptomFace,
      symptomArm: paddPatient2.symptomArm,
      symptomSpeech: paddPatient2.symptomSpeech,
      symptomVisual: paddPatient2.symptomVisual,
      symptomAphasia: paddPatient2.symptomAphasia,
      symptomNeglect: paddPatient2.symptomNeglect,
      selectedDiseases: paddPatient3.selectedDiseases,
      scoreDiseases: paddPatient3.onDiseasesScore,
      ctBrain: paddPatient3.ctBrainScore,
      ctBrainText: paddPatient3.ctBrainText,
      totalScore: widget.totalScore,
      selectedScore1: widget.selectedScore1,
      selectedScore2: widget.selectedScore2,
      selectedScore3: widget.selectedScore3,
      selectedScore4: widget.selectedScore4,
      selectedScore5: widget.selectedScore5,
      selectedScore6: widget.selectedScore6,
      selectedScore7: widget.selectedScore7,
      selectedScore8: widget.selectedScore8,
      selectedScore9: widget.selectedScore9,
      selectedScore10: widget.selectedScore10,
      selectedScore11: widget.selectedScore11,
      selectedScore12: widget.selectedScore12,
      selectedScore13: widget.selectedScore13,
      selectedScore14: widget.selectedScore14,
      selectedScore15: widget.selectedScore15,
      selectedText1: widget.selectedText1,
      selectedText2: widget.selectedText2,
      selectedText3: widget.selectedText3,
      selectedText4: widget.selectedText4,
      selectedText5: widget.selectedText5,
      selectedText6: widget.selectedText6,
      selectedText7: widget.selectedText7,
      selectedText8: widget.selectedText8,
      selectedText9: widget.selectedText9,
      selectedText10: widget.selectedText10,
      selectedText11: widget.selectedText11,
      selectedText12: widget.selectedText12,
      selectedText13: widget.selectedText13,
      selectedText14: widget.selectedText14,
      selectedText15: widget.selectedText15,
      nihssLevel: widget.nihssLevel,
      indications1: widget.indications1,
      indications2: widget.indications2,
      indications3: widget.indications3,
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
      strictlynotprohibited1: widget.strictlynotprohibited1,
      strictlynotprohibited2: widget.strictlynotprohibited2,
      strictlynotprohibited3: widget.strictlynotprohibited3,
      strictlynotprohibited4: widget.strictlynotprohibited4,
      strictlynotprohibited5: widget.strictlynotprohibited5,
      strictlynotprohibited6: widget.strictlynotprohibited6,
      additionalprohibitions1: widget.additionalprohibitions1,
      additionalprohibitions2: widget.additionalprohibitions2,
      additionalprohibitions3: widget.additionalprohibitions3,
      additionalprohibitions4: widget.additionalprohibitions4,
      medic1: widget.medic1,
      medic2: widget.medic2,
      medic3: widget.medic3,
      beforecure: widget.beforecure.text,
      aftercure: widget.aftercure.text,
      recordedTime1: recordedTime1,
      recordedTime2: recordedTime2,
    );

    // แปลงเป็น JSON และเพิ่มในลิสต์
    patientList.add(json.encode(patient.toMap()));
    await prefs.setStringList('patients', patientList);

    paddPatient2.setSymptomHead(-1);
    paddPatient2.setSymptomEye(-1);
    paddPatient2.setSymptomFace(-1);
    paddPatient2.setSymptomArm(-1);
    paddPatient2.setSymptomSpeech(-1);
    paddPatient2.setSymptomVisual(-1);
    paddPatient2.setSymptomAphasia(-1);
    paddPatient2.setSymptomNeglect(-1);
    paddPatient3.updateCtBrainScore(null, null);
    paddPatient3.updateSelectedDiseases('');
    paddPatient3.updateOnDiseasesScore(-1);
    quiz.updateScore1(-1, '');
  }

  Future<List<Patient>> loadPatients() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    return patientList.map((patientData) {
      Map<String, dynamic> map = Map.from(json.decode(patientData));
      return Patient.fromMap(map);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: Color(0xFF82B1FF),
          centerTitle: true,
          title: const Text(
            'ประเมินผล',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double padding = constraints.maxWidth * 0.05;
          double fontSizeTitle = constraints.maxWidth * 0.06;
          double fontSizeContent = constraints.maxWidth * 0.045;
          double spacing = constraints.maxHeight * 0.02;

          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 130),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NIHSS ${widget.totalScore} คะเเนน',
                      style: TextStyle(
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.bold,
                        color: widget.totalScore == 0
                            ? Colors.green
                            : (widget.totalScore >= 1 && widget.totalScore <= 4)
                                ? Colors.yellow[600]
                                : (widget.totalScore >= 5 &&
                                        widget.totalScore <= 15)
                                    ? Colors.orange
                                    : (widget.totalScore >= 16 &&
                                            widget.totalScore <= 20)
                                        ? Colors.amber[900]
                                        : (widget.totalScore >= 21)
                                            ? Colors.red
                                            : Colors.black,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    '${widget.nihssLevel}',
                    style: TextStyle(fontSize: fontSizeContent),
                  ),
                ),
                SizedBox(height: spacing * 1.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/dash.png',
                      width: constraints.maxWidth * 0.5,
                      height: constraints.maxWidth * 0.5,
                    ),
                  ],
                ),
                SizedBox(height: spacing * 2),
                Text(
                  'ชื่อ : ${widget.nameController.text.isNotEmpty ? widget.nameController.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'โรงพยาบาล : ${widget.hospitalController.text.isNotEmpty ? widget.hospitalController.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'อายุ : ${widget.ageController.text.isNotEmpty ? widget.ageController.text : 'ไม่ระบุ'} ปี',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'เพศ : ${widget.gender.isNotEmpty ? widget.gender : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'น้ำหนัก : ${widget.weightController.text.isNotEmpty ? widget.weightController.text : 'ไม่ระบุ'} กิโลกรัม',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'ความดันโลหิต : ${widget.systolicBloodPressureController.text.isNotEmpty ? widget.systolicBloodPressureController.text : 'ไม่ระบุ'} / ${widget.diastolicBloodPressureController.text.isNotEmpty ? widget.diastolicBloodPressureController.text : 'ไม่ระบุ'} mmHg',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'ระดับน้ำตาล: ${widget.sugarController.text.isNotEmpty ? widget.sugarController.text : 'ไม่ระบุ'} mg/dl',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาเริ่มมีอาการ : ${widget.dateTimeController1.text.isNotEmpty ? widget.dateTimeController1.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาถึงโรงพยาบาล : ${widget.dateTimeController2.text.isNotEmpty ? widget.dateTimeController2.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาได้รับยาลิ่มเลือด: ${widget.dateTimeController3.text.isNotEmpty ? widget.dateTimeController3.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาเมื่ออาการมาโรงพยาบาล: ${widget.timeDifference1 != null ? '${widget.timeDifference1!.toStringAsFixed(2)} ชั่วโมง' : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา: ${widget.timeDifference2 != null ? '${widget.timeDifference2!.toStringAsFixed(2)} ชั่วโมง' : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'โรคประจำตัว: ${widget.selectedDiseases.isNotEmpty ? widget.selectedDiseases : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'CT brain : ${widget.ctBrain != null ? widget.ctBrainText : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                SizedBox(height: spacing * 2.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        _recordTime();
                        savePatientData();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/patientList', (route) => false);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF82B1FF)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(150, 70)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'บันทึกข้อมูลผู้ป่วย',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing * 1.5),
              ],
            ),
          );
        },
      ),
    );
  }
}
