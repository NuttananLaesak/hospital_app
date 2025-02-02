import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hospital_app/Provider/Paddpatient2.dart';
import 'package:hospital_app/Provider/Paddpatient3.dart';
import 'package:hospital_app/Provider/Paddpatient4.dart';
import 'package:hospital_app/Provider/Paddpatient5.dart';
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
  final int totalScore;
  final String nihssLevel;
  final double medic1;
  final double medic2;
  final double medic3;
  final TextEditingController beforecure;
  final TextEditingController aftercure;

  const AddPatient10({
    Key? key,
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
    required this.totalScore,
    required this.nihssLevel,
    required this.medic1,
    required this.medic2,
    required this.medic3,
    required this.beforecure,
    required this.aftercure,
  }) : super(key: key);

  @override
  State<AddPatient10> createState() => _AddPatient10State();
}

class _AddPatient10State extends State<AddPatient10> {
  String? recordedTime1; // ตัวแปรสำหรับเก็บเวลา
  String? recordedTime2; // ตัวแปรสำหรับเก็บเวลา
  late int initialIndications1;
  late int initialIndications2;
  late int initialIndications3;
  late int initialStrictlyprohibited1;
  late int initialStrictlyprohibited2;
  late int initialStrictlyprohibited3;
  late int initialStrictlyprohibited4;
  late int initialStrictlyprohibited5;
  late int initialStrictlyprohibited6;
  late int initialStrictlyprohibited7;
  late int initialStrictlyprohibited8;
  late int initialStrictlyprohibited9;
  late int initialStrictlyprohibited10;
  late int initialStrictlyprohibited11;
  late int initialStrictlyprohibited12;
  late int initialStrictlyprohibited13;
  late int initialStrictlyprohibited14;
  late int initialStrictlynotprohibited1;
  late int initialStrictlynotprohibited2;
  late int initialStrictlynotprohibited3;
  late int initialStrictlynotprohibited4;
  late int initialStrictlynotprohibited5;
  late int initialStrictlynotprohibited6;
  late int initialAdditionalprohibitions1;
  late int initialAdditionalprohibitions2;
  late int initialAdditionalprohibitions3;
  String rtpa = '';

  @override
  void initState() {
    super.initState();
    final paddPatient4 = Provider.of<Paddpatient4>(context, listen: false);
    final paddPatient5 = Provider.of<Paddpatient5>(context, listen: false);
    initialIndications1 = paddPatient4.indications1;
    initialIndications2 = paddPatient4.indications2;
    initialIndications3 = paddPatient4.indications3;
    initialStrictlyprohibited1 = paddPatient4.strictlyprohibited1;
    initialStrictlyprohibited2 = paddPatient4.strictlyprohibited2;
    initialStrictlyprohibited3 = paddPatient4.strictlyprohibited3;
    initialStrictlyprohibited4 = paddPatient4.strictlyprohibited4;
    initialStrictlyprohibited5 = paddPatient4.strictlyprohibited5;
    initialStrictlyprohibited6 = paddPatient4.strictlyprohibited6;
    initialStrictlyprohibited7 = paddPatient4.strictlyprohibited7;
    initialStrictlyprohibited8 = paddPatient4.strictlyprohibited8;
    initialStrictlyprohibited9 = paddPatient4.strictlyprohibited9;
    initialStrictlyprohibited10 = paddPatient4.strictlyprohibited10;
    initialStrictlyprohibited11 = paddPatient4.strictlyprohibited11;
    initialStrictlyprohibited12 = paddPatient4.strictlyprohibited12;
    initialStrictlyprohibited13 = paddPatient4.strictlyprohibited13;
    initialStrictlyprohibited14 = paddPatient4.strictlyprohibited14;
    initialStrictlynotprohibited1 = paddPatient5.strictlynotprohibited1;
    initialStrictlynotprohibited2 = paddPatient5.strictlynotprohibited2;
    initialStrictlynotprohibited3 = paddPatient5.strictlynotprohibited3;
    initialStrictlynotprohibited4 = paddPatient5.strictlynotprohibited4;
    initialStrictlynotprohibited5 = paddPatient5.strictlynotprohibited5;
    initialStrictlynotprohibited6 = paddPatient5.strictlynotprohibited6;
    initialAdditionalprohibitions1 = paddPatient5.additionalprohibitions1;
    initialAdditionalprohibitions2 = paddPatient5.additionalprohibitions2;
    initialAdditionalprohibitions3 = paddPatient5.additionalprohibitions3;
  }

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
    final paddpatient4 = Provider.of<Paddpatient4>(context, listen: false);
    final paddpatient5 = Provider.of<Paddpatient5>(context, listen: false);

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
      selectedScore1: quiz.selectedScore1,
      selectedScore2: quiz.selectedScore2,
      selectedScore3: quiz.selectedScore3,
      selectedScore4: quiz.selectedScore4,
      selectedScore5: quiz.selectedScore5,
      selectedScore6: quiz.selectedScore6,
      selectedScore7: quiz.selectedScore7,
      selectedScore8: quiz.selectedScore8,
      selectedScore9: quiz.selectedScore9,
      selectedScore10: quiz.selectedScore10,
      selectedScore11: quiz.selectedScore11,
      selectedScore12: quiz.selectedScore12,
      selectedScore13: quiz.selectedScore13,
      selectedScore14: quiz.selectedScore14,
      selectedScore15: quiz.selectedScore15,
      selectedText1: quiz.selectedText1,
      selectedText2: quiz.selectedText2,
      selectedText3: quiz.selectedText3,
      selectedText4: quiz.selectedText4,
      selectedText5: quiz.selectedText5,
      selectedText6: quiz.selectedText6,
      selectedText7: quiz.selectedText7,
      selectedText8: quiz.selectedText8,
      selectedText9: quiz.selectedText9,
      selectedText10: quiz.selectedText10,
      selectedText11: quiz.selectedText11,
      selectedText12: quiz.selectedText12,
      selectedText13: quiz.selectedText13,
      selectedText14: quiz.selectedText14,
      selectedText15: quiz.selectedText15,
      nihssLevel: widget.nihssLevel,
      indications1: paddpatient4.indications1,
      indications2: paddpatient4.indications2,
      indications3: paddpatient4.indications3,
      strictlyprohibited1: paddpatient4.strictlyprohibited1,
      strictlyprohibited2: paddpatient4.strictlyprohibited2,
      strictlyprohibited3: paddpatient4.strictlyprohibited3,
      strictlyprohibited4: paddpatient4.strictlyprohibited4,
      strictlyprohibited5: paddpatient4.strictlyprohibited5,
      strictlyprohibited6: paddpatient4.strictlyprohibited6,
      strictlyprohibited7: paddpatient4.strictlyprohibited7,
      strictlyprohibited8: paddpatient4.strictlyprohibited8,
      strictlyprohibited9: paddpatient4.strictlyprohibited9,
      strictlyprohibited10: paddpatient4.strictlyprohibited10,
      strictlyprohibited11: paddpatient4.strictlyprohibited11,
      strictlyprohibited12: paddpatient4.strictlyprohibited12,
      strictlyprohibited13: paddpatient4.strictlyprohibited13,
      strictlyprohibited14: paddpatient4.strictlyprohibited14,
      strictlynotprohibited1: paddpatient5.strictlynotprohibited1,
      strictlynotprohibited2: paddpatient5.strictlynotprohibited2,
      strictlynotprohibited3: paddpatient5.strictlynotprohibited3,
      strictlynotprohibited4: paddpatient5.strictlynotprohibited4,
      strictlynotprohibited5: paddpatient5.strictlynotprohibited5,
      strictlynotprohibited6: paddpatient5.strictlynotprohibited6,
      additionalprohibitions1: paddpatient5.additionalprohibitions1,
      additionalprohibitions2: paddpatient5.additionalprohibitions2,
      additionalprohibitions3: paddpatient5.additionalprohibitions3,
      additionalprohibitions4: paddpatient5.additionalprohibitions4,
      medic1: widget.medic1,
      medic2: widget.medic2,
      medic3: widget.medic3,
      beforecure: widget.beforecure.text,
      aftercure: widget.aftercure.text,
      recordedTime1: recordedTime1,
      recordedTime2: recordedTime2,
      rtpa: rtpa,
    );

    // แปลงเป็น JSON และเพิ่มในลิสต์
    patientList.add(json.encode(patient.toMap()));
    await prefs.setStringList('patients', patientList);

    paddPatient2.resetSymptom();
    paddPatient3.resetCtBrainAndnDiseasesScore();
    quiz.resetScoresAndTexts();
    paddpatient4.resetIndicationsAndStrictlyprohibited();
    paddpatient5.resetAdditionalprohibitions();
  }

  Future<List<Patient>> loadPatients() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    return patientList.map((patientData) {
      Map<String, dynamic> map = Map.from(json.decode(patientData));
      return Patient.fromMap(map);
    }).toList();
  }

  void _updatertpa() {
    bool indicationsValid1 = (initialIndications1 == 0 &&
        initialIndications2 == 0 &&
        initialIndications3 == 0);
    bool strictlyProhibitedValid1 = initialStrictlyprohibited1 == 0 ||
        initialStrictlyprohibited2 == 0 ||
        initialStrictlyprohibited3 == 0 ||
        initialStrictlyprohibited4 == 0 ||
        initialStrictlyprohibited5 == 0 ||
        initialStrictlyprohibited6 == 0 ||
        initialStrictlyprohibited7 == 0 ||
        initialStrictlyprohibited8 == 0 ||
        initialStrictlyprohibited9 == 0 ||
        initialStrictlyprohibited10 == 0 ||
        initialStrictlyprohibited11 == 0 ||
        initialStrictlyprohibited12 == 0 ||
        initialStrictlyprohibited13 == 0 ||
        initialStrictlyprohibited14 == 0;
    bool strictlyNotProhibitedValid1 = initialStrictlynotprohibited1 == 0 ||
        initialStrictlynotprohibited2 == 0 ||
        initialStrictlynotprohibited3 == 0 ||
        initialStrictlynotprohibited4 == 0 ||
        initialStrictlynotprohibited5 == 0 ||
        initialStrictlynotprohibited6 == 0 ||
        initialAdditionalprohibitions1 == 0 ||
        initialAdditionalprohibitions2 == 0;

    if (indicationsValid1 &&
        strictlyProhibitedValid1 &&
        (strictlyNotProhibitedValid1)) {
      setState(() {
        rtpa = 'ให้ยาไม่ได้ มีข้อห้าม';
      });
    } else if (initialIndications1 == 1 &&
        initialIndications2 == 1 &&
        initialIndications3 == 1 &&
        initialStrictlyprohibited1 == 1 &&
        initialStrictlyprohibited2 == 1 &&
        initialStrictlyprohibited3 == 1 &&
        initialStrictlyprohibited4 == 1 &&
        initialStrictlyprohibited5 == 1 &&
        initialStrictlyprohibited6 == 1 &&
        initialStrictlyprohibited7 == 1 &&
        initialStrictlyprohibited8 == 1 &&
        initialStrictlyprohibited9 == 1 &&
        initialStrictlyprohibited10 == 1 &&
        initialStrictlyprohibited11 == 1 &&
        initialStrictlyprohibited12 == 1 &&
        initialStrictlyprohibited13 == 1 &&
        initialStrictlyprohibited14 == 1 &&
        (strictlyNotProhibitedValid1)) {
      setState(() {
        rtpa = 'อาจจะให้ยาได้';
      });
    } else if (initialIndications1 == 1 &&
        initialIndications2 == 1 &&
        initialIndications3 == 1 &&
        initialStrictlyprohibited1 == 1 &&
        initialStrictlyprohibited2 == 1 &&
        initialStrictlyprohibited3 == 1 &&
        initialStrictlyprohibited4 == 1 &&
        initialStrictlyprohibited5 == 1 &&
        initialStrictlyprohibited6 == 1 &&
        initialStrictlyprohibited7 == 1 &&
        initialStrictlyprohibited8 == 1 &&
        initialStrictlyprohibited9 == 1 &&
        initialStrictlyprohibited10 == 1 &&
        initialStrictlyprohibited11 == 1 &&
        initialStrictlyprohibited12 == 1 &&
        initialStrictlyprohibited13 == 1 &&
        initialStrictlyprohibited14 == 1 &&
        initialStrictlynotprohibited1 == 1 &&
        initialStrictlynotprohibited2 == 1 &&
        initialStrictlynotprohibited3 == 1 &&
        initialStrictlynotprohibited4 == 1 &&
        initialStrictlynotprohibited5 == 1 &&
        initialStrictlynotprohibited6 == 1 &&
        initialAdditionalprohibitions1 == 1 &&
        initialAdditionalprohibitions2 == 1) {
      setState(() {
        rtpa = 'ให้ยาได้ ไม่มีข้อห้าม';
      });
    } else if (initialIndications1 == -1 ||
        initialIndications2 == -1 ||
        initialIndications3 == -1 ||
        initialStrictlyprohibited1 == -1 ||
        initialStrictlyprohibited2 == -1 ||
        initialStrictlyprohibited3 == -1 ||
        initialStrictlyprohibited4 == -1 ||
        initialStrictlyprohibited5 == -1 ||
        initialStrictlyprohibited6 == -1 ||
        initialStrictlyprohibited7 == -1 ||
        initialStrictlyprohibited8 == -1 ||
        initialStrictlyprohibited9 == -1 ||
        initialStrictlyprohibited10 == -1 ||
        initialStrictlyprohibited11 == -1 ||
        initialStrictlyprohibited12 == -1 ||
        initialStrictlyprohibited13 == -1 ||
        initialStrictlyprohibited14 == -1 ||
        initialStrictlynotprohibited1 == -1 ||
        initialStrictlynotprohibited2 == -1 ||
        initialStrictlynotprohibited3 == -1 ||
        initialStrictlynotprohibited4 == -1 ||
        initialStrictlynotprohibited5 == -1 ||
        initialStrictlynotprohibited6 == -1 ||
        initialAdditionalprohibitions1 == -1 ||
        initialAdditionalprohibitions2 == -1) {
      setState(() {
        rtpa = 'ระบุไม่ครบ';
      });
    } else {
      setState(() {
        rtpa = 'ไม่ตรงตามเงื่อนไข';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final paddPatient3 = Provider.of<Paddpatient3>(context, listen: false);

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
                  'โรคประจำตัว: ${paddPatient3.selectedDiseases.isNotEmpty ? paddPatient3.selectedDiseases : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'CT brain : ${paddPatient3.ctBrainScore != null ? paddPatient3.ctBrainText : 'ไม่ระบุ'}',
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
                        _updatertpa();
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
