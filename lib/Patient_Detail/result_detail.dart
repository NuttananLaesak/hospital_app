import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class ResultDetail extends StatefulWidget {
  final int patientId;

  const ResultDetail({Key? key, required this.patientId}) : super(key: key);

  @override
  State<ResultDetail> createState() => _ResultDetailState();
}

class _ResultDetailState extends State<ResultDetail> {
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
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    String CheckSymptom1(int? value) {
      switch (value) {
        case 1:
          return 'มี';
        case 0:
          return 'ไม่มี';
        case -1:
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    String CheckSymptom2(int value) {
      switch (value) {
        case 0:
          return 'ปกติ';
        case 1:
          return 'ซ้าย';
        case 2:
          return 'ขวา';
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    String CheckSymptom3(int value) {
      switch (value) {
        case 0:
          return 'ปกติ';
        case 1:
          return 'มองไม่เห็นครึ่งซีกซ้าย';
        case 2:
          return 'มองไม่เห็นครึ่งซีกขวา';
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    String CheckSymptom4(int value) {
      switch (value) {
        case 0:
          return 'ปกติ';
        case 1:
          return 'ไม่พูดเเต่ทำตาม\nคำสั่งได้ถูกต้อง';
        case 2:
          return 'ไม่พูดเเละไม่ทำตามคำสั่ง';
        case 3:
          return 'ตอบไม่ตรงคำถาม\nเเละไม่ทำตามคำสั่ง';
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    String ctbrainText(int? value) {
      switch (value) {
        case 0:
          return 'Not Available';
        case 1:
          return 'Normal';
        case 2:
          return 'Hypodensity < 1/3 M CA';
        case 3:
          return 'Hypodensity > 1/3 M CA';
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    String checkIndication(int? value) {
      if (value == null) {
        return 'ไม่ได้ระบุ';
      }
      switch (value) {
        case 0:
          return 'ไม่';
        case 1:
          return 'ใช่';
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    String checkProhibited(int? value) {
      if (value == null) {
        return 'ไม่ได้ระบุ';
      }
      switch (value) {
        case 0:
          return 'มี';
        case 1:
          return 'ไม่มี';
        default:
          return 'ไม่ได้ระบุ';
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

    String patientDetails = '''
ข้อมูลผู้ป่วยโรคหลอดเลือดสมอง

ข้อมูลเบื้องต้น
ชื่อ: ${_patient?.nameController.isNotEmpty == true ? _patient!.nameController : 'ไม่ได้ระบุ'}
โรงพยาบาล: ${_patient?.hospitalController.isNotEmpty == true ? _patient!.hospitalController : 'ไม่ได้ระบุ'}
อายุ: ${_patient?.ageController == null ? 'ไม่ได้ระบุ' : _patient!.ageController == 0 ? 'ไม่ได้ระบุ' : _patient!.ageController} ปี
เพศ: ${_patient?.gender.isNotEmpty == true ? _patient!.gender : 'ไม่ได้ระบุ'}
น้ำหนัก: ${_patient?.weightController.isNotEmpty == true ? _patient!.weightController : 'ไม่ได้ระบุ'}' กิโลกรัม
ความดันโลหิต: ${_patient?.systolicBloodPressureController ?? 'ไม่ระบุ'}/${_patient?.diastolicBloodPressureController ?? 'ไม่ระบุ'} (mg/dl)
ระดับน้ำตาลในเลือด: ${_patient?.sugarController.isNotEmpty == true ? _patient!.sugarController : 'ไม่ได้ระบุ'} (mg/dl)
โรคประจำตัว: ${_patient?.selectedDiseases.isNotEmpty == true ? _patient!.selectedDiseases : 'ไม่ได้ระบุ'}
CT Brain: ${_patient?.ctBrainText?.isNotEmpty == true ? _patient!.ctBrainText : 'ไม่ได้ระบุ'}

วันที่เเละเวลาที่บันทึกข้อมูล
เวลาที่เริ่มมีอาการ
${_patient?.dateTimeController1.isNotEmpty == true ? _patient!.dateTimeController1 : 'ไม่ได้ระบุ'}
เวลาที่มาถึงโรงพยาบาล
${_patient?.dateTimeController2.isNotEmpty == true ? _patient!.dateTimeController2 : 'ไม่ได้ระบุ'}
เวลาที่ใช้ยาละลายลิ่มเลือด
${_patient?.dateTimeController3.isNotEmpty == true ? _patient!.dateTimeController3 : 'ไม่ได้ระบุ'}

ระยะเวลาที่ใช้
ระยะเวลาเมื่อมีอาการมาโรงพยาบาล
ใช้เวลา ${_patient?.timeDifference1?.toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง'
ระยะเวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา
ใช้เวลา ${_patient?.timeDifference2?.toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง'

อาการ
1. เวียนศรีษะ เดินเซ: ${CheckSymptom1(_patient?.symptomHead)}
2. อาการตาดับทันทีทันใด: ${CheckSymptom1(_patient?.symptomEye)}
3. หน้าเบี้ยวฉียบพลัน: ${CheckSymptom2(_patient?.symptomFace ?? -1)}
4. อ่อนแอแขน/ขาเฉียบพลัน: ${CheckSymptom2(_patient?.symptomArm ?? -1)}
5. พูดลำบาก/พูดไม่ชัด: ${CheckSymptom1(_patient?.symptomSpeech)}
6. การมองเห็น: ${CheckSymptom3(_patient?.symptomVisual ?? -1)}
7. การเข้าใจภาษา: ${CheckSymptom4(_patient?.symptomAphasia ?? -1)}
8. ไม่สนใจร่างกายหนึ่งด้าน: ${CheckSymptom1(_patient?.symptomNeglect ?? -1)}

ระดับโรคหลอดเลือดสมอง
NIHSS ${_patient?.totalScore} คะเเนน'
'ระดับความรุนเเรง ${_patient?.nihssLevel}'

คะเเนนเเต่ล่ะข้อของเเบบประเมินโรคหลอดเลือดสมองะ
ข้อที่ 1a ระดับความรู้สึก(Level of Consciousness, LOC): ${_patient?.selectedText1}(${_patient?.selectedScore1})
ข้อที่ 1b สามารถบอกเดือนและอายุได้(LOC Questions): ${_patient?.selectedText2}(${_patient?.selectedScore2})
ข้อที่ 1c สามารถหลับตา-ลืมได้เเละกำมือ-คลายมือได้ (LOC Commands): ${_patient?.selectedText3}(${_patient?.selectedScore3})
ข้อที่ 2 การเคลื่อนไหวของตา(Best Gaze): ${_patient?.selectedText4}(${_patient?.selectedScore4})
ข้อที่ 3 การมองเห็น(Visual Fields): ${_patient?.selectedText5}(${_patient?.selectedScore5})
ข้อที่ 4 การเคลื่อนไหวของกล้ามเนื้อใบหน้า (Facial Palsy): ${_patient?.selectedText6}(${_patient?.selectedScore6})
ข้อที่ 5a กำลังของกล้ามเนื้อเเขนซ้าย(Motor Left Arm): ${_patient?.selectedText7}(${_patient?.selectedScore7})
ข้อที่ 5b กำลังของกล้ามเนื้อเเขนขวา(Motor Right Arm): ${_patient?.selectedText8}(${_patient?.selectedScore8})
ข้อที่ 6a กำลังของกล้ามเนื้อขาซ้าย(Motor Left Leg): ${_patient?.selectedText9}(${_patient?.selectedScore9})
ข้อที่ 6b กำลังของกล้ามเนื้อขาขวา(Motor Right Leg): ${_patient?.selectedText10}(${_patient?.selectedScore10})
ข้อที่ 7 การประสานของเเขนขา(Limb Ataxia): ${_patient?.selectedText11}(${_patient?.selectedScore11})
ข้อที่ 8 การรับความรู้สึก(Sensory): ${_patient?.selectedText12}(${_patient?.selectedScore12})
ข้อที่ 9 ความสามารถด้านภาษา(Best Language): ${_patient?.selectedText13}(${_patient?.selectedScore13})
ข้อที่ 10 การออกเสียง (Dysarthia): ${_patient?.selectedText14}(${_patient?.selectedScore14})
ข้อที่ 11 การขาดความสนใจในด้านใดด้านหนึ่งของร่างกาย\n(Extinetion and Inattention): ${_patient?.selectedText15}(${_patient?.selectedScore15})

ข้อบ่งชี้
1. มีอายุเท่ากับหรือมากกว่า 18 ปี:${checkIndication(_patient?.indications2)},
2. มีอาการของหลอดเลือดสมองตีบ\nภายในระยะเวลา 4.5 ชั่วโมง:${checkIndication(_patient?.indications1)},
3. ผล CT brain ไม่พบว่ามีเลือดออก\nในเนื้อสมองหรือชั้นใต้เยื่อหุ้มสมอง:${checkIndication(_patient?.indications3)},

ข้อห้ามอย่างเด็ดขาด
1. มีความดันโลหิตช่วงก่อนให้รักษาสูง(SBP > 185 mm/Hg)(DBP > 110 mm/Hg):${checkProhibited(_patient?.strictlyprohibited7)}
2. มีประวัติเคยมีเลือดออกในสมองมาก่อน:${checkProhibited(_patient?.strictlyprohibited3)}
4. มีอาการบาดเจ็บที่ศรีษะอย่างรุนเเรงหรือมีประวัติเป็นโรคหลอดเลือดสมองใน 3 เดือน:${checkProhibited(_patient?.strictlyprohibited1)}
5. มีประวัติได้รับยาต้านการเเข็งตัวของเลือดโดยมีค่า PT > 15 วินาที หรือมีค่า INR > 1.7:${checkProhibited(_patient?.strictlyprohibited9)}
6. มีความดันโลหิตสูงเเละไม่สามารถลดความดันโลหิตลงได้ก่อนให้ยาละลายลิ่มเลือด:${checkProhibited(_patient?.strictlyprohibited12)}
7. ได้รับยา heparin ภายใน 48 ชั่วโมงเเละ\nมีค่า partial-thromboplastin time ผิดปกติ:${checkProhibited(_patient?.strictlyprohibited13)}
8. มีปริมาณเกล็ดเลือดน้อยกว่า \n100,000 ต่อลูกบาศก์มิลลิเมตร:${checkProhibited(_patient?.strictlyprohibited14)}
9. CT brain พบมีสมองขาดเลือดมากกว่าขนาด 1/3 ชอง cerebral hemisphere${checkProhibited(_patient?.strictlyprohibited11)}
10. มีระดับน้ำตาลในเลือดเท่ากับหรือ\nน้อยกว่า 50 mg/dl:${checkProhibited(_patient?.strictlyprohibited10)}
11. มีการได้รับการผ่าตัดกระโหลกศรีษะ \nหรือกระดูกสันหลังภายใน 3 เดือน:${checkProhibited(_patient?.strictlyprohibited6)}
12. มีภาวะเลือดออกเเละอวัยวะภายใน\n(Active Internal Bleeding):${checkProhibited(_patient?.strictlyprohibited8)}
13. มีภาวะสงสัยเลือดออกชั้นใต้เยื่อหุ้มสมอง\n(Subarachnoid Hemorrhage):${checkProhibited(_patient?.strictlyprohibited2)}
14. มีการเเทงหลอกเลือดเเดงขนาดใหญ่ใน\nตำเเหน่งที่ไม่สามารถกดได้ภายใน 7 วัน:${checkProhibited(_patient?.strictlyprohibited5)}

ข้อห้ามที่ไม่ถือว่าห้ามอย่างเด็ดขาด
1. มีอาการทางประสาทดีขึ้นอย่างรวดเร็วจนเกือบเป็นปกติหรือมีอาการอย่างเดียวไม่รุนเเรง:${checkProhibited(_patient?.strictlynotprohibited1)}
2. มีอาการชักตอนเริ่มต้นเเละภายหลัง\nจากชักยังมีอาการอ่อนเเรงอยู่:${checkProhibited(_patient?.strictlynotprohibited3)}
3. เคยมีประวัติการผ่าตัดใหญ่หรือ\nมีอุบัติเหตุรุนเเรงภายใน 14 วัน:${checkProhibited(_patient?.strictlynotprohibited4)}
4. มีเลือดออกในทางเดินอาหารหรือ\nทางเดินปัสสสาวะภายใน 21 วัน:${checkProhibited(_patient?.strictlynotprohibited5)}
5. มีประวัติกล้ามเนื้อหัวใจขาดเลือด\nภายใน 3 เดือน:${checkProhibited(_patient?.strictlynotprohibited6)}
6. มีการตั้งครรภ์:${checkProhibited(_patient?.strictlynotprohibited2)}
7. เคยเป็นโรคหลอดเลือดสมองตีบหรือ\nหลอดเลือดสมองอุดตันภายใน 3 เดือน:${checkProhibited(_patient?.strictlynotprohibited2)}
8. มีคะเเนน NIHSS มากกว่า 25 คะเเนน:${checkProhibited(_patient?.strictlynotprohibited1)}

การให้ยาผู้ป่วย
ปริมาณยาละลายลิ่มเลือด
(rt-PA) ${_patient?.medic1.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม
แบ่งให้ ${_patient?.medic2.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม
ทางหลอดเลือดใน 1 นาที'
'และ ${_patient?.medic3.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม
หยดทางหลอดเลือดใน 60 นาที',

ผลการรักษา
ก่อนการรักษา
${_patient?.beforecure ?? 'ไม่ระบุ'}
หลังการรักษา
${_patient?.aftercure ?? 'ไม่ระบุ'}
      ''';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'รายงานผล',
            style: TextStyle(
              fontSize: height * 0.026,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                // คัดลอกข้อมูลไปที่คลิปบอร์ด
                await Clipboard.setData(ClipboardData(text: patientDetails));
              },
              child: Image.asset(
                'images/clipboard.png',
                width: 33, // ปรับขนาดไอคอนตามต้องการ
                height: 33,
              ),
            ),
            SizedBox(width: 20), // ให้ระยะห่างระหว่างปุ่มและขอบขวาของ AppBar
          ],
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
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
              ),
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
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Column(children: [
                    Column(
                      children: [
                        Text(
                          'ข้อมูลเบื้องต้น',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ชื่อ : ${_patient?.nameController.isNotEmpty == true ? _patient!.nameController : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'โรงพยาบาล : ${_patient?.hospitalController.isNotEmpty == true ? _patient!.hospitalController : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'อายุ : ${_patient?.ageController == null ? 'ไม่ได้ระบุ' : _patient!.ageController == 0 ? 'ไม่ได้ระบุ' : _patient!.ageController} ปี',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'เพศ : ${_patient?.gender.isNotEmpty == true ? _patient!.gender : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'น้ำหนัก : ${_patient?.weightController.isNotEmpty == true ? _patient!.weightController : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'ความดันโลหิต : ${_patient?.systolicBloodPressureController ?? 'ไม่ระบุ'}/${_patient?.diastolicBloodPressureController ?? 'ไม่ระบุ'} (mmHg)',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'ระดับน้ำตาลในเลือด : ${_patient?.sugarController.isNotEmpty == true ? _patient!.sugarController : 'ไม่ได้ระบุ'} (mg/dl)',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'โรคประจำตัว : ${_patient?.selectedDiseases.isNotEmpty == true ? _patient!.selectedDiseases : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CT Brain : ${_patient?.ctBrainText?.isNotEmpty == true ? _patient!.ctBrainText : 'ไม่ได้ระบุ'}',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'วันที่และเวลาที่บันทึกข้อมูล',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'เวลาที่เริ่มมีอาการ',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Text(
                          '${_patient?.dateTimeController1.isNotEmpty == true ? _patient?.dateTimeController1 : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'เวลาที่มาถึงโรงพยาบาล',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Text(
                          '${_patient?.dateTimeController2.isNotEmpty == true ? _patient?.dateTimeController2 : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'เวลาที่ใช้ยาละลายลิ่มเลือด',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Text(
                          '${_patient?.dateTimeController3.isNotEmpty == true ? _patient?.dateTimeController3 : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ระยะเวลาที่ใช้',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ระยะเวลาเมีอมีอาการมาโรงพยาบาล\nใช้เวลา ${_patient?.timeDifference1!.toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(),
                        Text(
                          'ระยะเวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา\nใช้เวลา ${_patient?.timeDifference2!.toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'อาการ',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'เวียนศรีษะ เดินเซ',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom1(_patient?.symptomHead),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ตาดับทันทีทันใด\nมองเห็นภาพซ้อนเฉียบพลัน',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom1(_patient?.symptomEye),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'หน้าเบี้ยวฉียบพลัน',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom2(_patient?.symptomFace ?? -1),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'อ่อนเเรงเเขน/ขาเฉียบพลัน',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom2(_patient?.symptomArm ?? -1),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'พูดลำบาก/พูดไม่ชัด/\nนึกคำพูดไม่ออกเฉียบพลัน',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom1(_patient?.symptomSpeech),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'การมองเห็น',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom3(_patient?.symptomVisual ?? -1),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'การเข้าใจภาษา',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom4(_patient?.symptomAphasia ?? -1),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ไม่สนใจร่างกายหนึ่งด้าน',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              CheckSymptom1(_patient?.symptomNeglect),
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ระดับโรคหลอดเลือดสมอง',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'NIHSS ${_patient?.totalScore} คะเเนน',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'ระดับความรุนเเรง ${_patient?.nihssLevel}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ข้อบ่งชี้',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        buildRow(
                          height,
                          width,
                          'มีอายุเท่ากับหรือมากกว่า 18 ปี',
                          checkIndication(_patient?.indications2),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีอาการของหลอดเลือดสมองตีบ\nภายในระยะเวลา 4.5 ชั่วโมง',
                          checkIndication(_patient?.indications1),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'ผล CT brain ไม่พบว่ามีเลือดออก\nในเนื้อสมองหรือชั้นใต้เยื่อหุ้มสมอง',
                          checkIndication(_patient?.indications3),
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ข้อห้ามอย่างเด็ดขาด',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        buildRow(
                          height,
                          width,
                          'มีความดันโลหิตช่วงก่อนให้รักษาสูง\n(SBP > 185 mm/Hg)(DBP > 110 mm/Hg)',
                          checkProhibited(_patient?.strictlyprohibited7),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีประวัติเคยมีเลือดออกในสมองมาก่อน',
                          checkProhibited(_patient?.strictlyprohibited3),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีเนื้องอกในสมอง , Aneuysm, Arteriovenous Malformation',
                          checkProhibited(_patient?.strictlyprohibited4),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีอาการบาดเจ็บที่ศรีษะอย่างรุนเเรงหรือมีประวัติเป็นโรคหลอดเลือดสมองใน 3 เดือน',
                          checkProhibited(_patient?.strictlyprohibited1),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีประวัติได้รับยาต้านการเเข็งตัวของเลือด \nโดยมีค่า PT > 15 วินาที หรือมีค่า INR > 1.7',
                          checkProhibited(_patient?.strictlyprohibited9),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีความดันโลหิตสูงเเละไม่สามารถลดความดันโลหิตลงได้ก่อนให้ยาละลายลิ่มเลือด',
                          checkProhibited(_patient?.strictlyprohibited12),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'ได้รับยา heparin ภายใน 48 ชั่วโมงเเละ\nมีค่า partial-thromboplastin time ผิดปกติ',
                          checkProhibited(_patient?.strictlyprohibited13),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีปริมาณเกล็ดเลือดน้อยกว่า \n100,000 ต่อลูกบาศก์มิลลิเมตร',
                          checkProhibited(_patient?.strictlyprohibited14),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'CT brain พบมีสมองขาดเลือดมากกว่าขนาด 1/3 ชอง cerebral hemisphere',
                          checkProhibited(_patient?.strictlyprohibited11),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีระดับน้ำตาลในเลือดเท่ากับหรือ\nน้อยกว่า 50 mg/dl',
                          checkProhibited(_patient?.strictlyprohibited10),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีการได้รับการผ่าตัดกระโหลกศรีษะ \nหรือกระดูกสันหลังภายใน 3 เดือน',
                          checkProhibited(_patient?.strictlyprohibited6),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีภาวะเลือดออกเเละอวัยวะภายใน\n(Active Internal Bleeding)',
                          checkProhibited(_patient?.strictlyprohibited8),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีภาวะสงสัยเลือดออกชั้นใต้เยื่อหุ้มสมอง\n(Subarachnoid Hemorrhage)',
                          checkProhibited(_patient?.strictlyprohibited2),
                        ),
                        buildRow(
                          height,
                          width,
                          'มีการเเทงหลอกเลือดเเดงขนาดใหญ่ใน\nตำเเหน่งที่ไม่สามารถกดได้ภายใน 7 วัน',
                          checkProhibited(_patient?.strictlyprohibited5),
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ข้อห้ามที่ไม่ถือว่าห้ามอย่างเด็ดขาด',
                          style: TextStyle(
                            fontSize: height * 0.024,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        buildRow(
                          height,
                          width,
                          'มีอาการทางประสาทดีขึ้นอย่างรวดเร็วจนเกือบเป็นปกติหรือมีอาการอย่างเดียวไม่รุนเเรง',
                          checkProhibited(_patient?.strictlynotprohibited1),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีอาการชักตอนเริ่มต้นเเละภายหลัง\nจากชักยังมีอาการอ่อนเเรงอยู่',
                          checkProhibited(_patient?.strictlynotprohibited3),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'เคยมีประวัติการผ่าตัดใหญ่หรือ\nมีอุบัติเหตุรุนเเรงภายใน 14 วัน',
                          checkProhibited(_patient?.strictlynotprohibited4),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีเลือดออกในทางเดินอาหารหรือ\nทางเดินปัสสสาวะภายใน 21 วัน',
                          checkProhibited(_patient?.strictlynotprohibited5),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีประวัติกล้ามเนื้อหัวใจขาดเลือด\nภายใน 3 เดือน',
                          checkProhibited(_patient?.strictlynotprohibited6),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีการตั้งครรภ์',
                          checkProhibited(_patient?.strictlynotprohibited2),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'เคยเป็นโรคหลอดเลือดสมองตีบหรือ\nหลอดเลือดสมองอุดตันภายใน 3 เดือน',
                          checkProhibited(_patient?.additionalprohibitions2),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีคะเเนน NIHSS มากกว่า 25 คะเเนน',
                          checkProhibited(_patient?.additionalprohibitions1),
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
                            ],
                          )
                        else
                          Column(
                            children: [
                              Text(
                                'ปริมาณยาละลายลิ่มเลือด\n(rt-PA) ${_patient?.medic1.toStringAsFixed(2) ?? 'ไม่ได้ระบุ'} มิลลิกรัม',
                                style: TextStyle(fontSize: height * 0.02),
                                textAlign: TextAlign.center,
                              ),
                              Divider(),
                              Text(
                                'แบ่งให้ ${_patient?.medic2.toStringAsFixed(2) ?? 'ไม่ได้ระบุ'} มิลลิกรัม\nทางหลอดเลือดใน 1 นาที',
                                style: TextStyle(fontSize: height * 0.02),
                                textAlign: TextAlign.center,
                              ),
                              Divider(),
                              Text(
                                'และ ${_patient?.medic3.toStringAsFixed(2) ?? 'ไม่ได้ระบุ'} มิลลิกรัม\nหยดทางหลอดเลือดใน 60 นาที',
                                style: TextStyle(fontSize: height * 0.02),
                                textAlign: TextAlign.center,
                              ),
                              Divider(),
                              SizedBox(height: height * 0.04),
                              Divider(
                                color: Color(0xFF82B1FF),
                                thickness: 2.0,
                              ),
                              Text(
                                'ผลการรักษา',
                                style: TextStyle(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                color: Color(0xFF82B1FF),
                                thickness: 2.0,
                              ),
                              Divider(),
                              Text(
                                'ก่อนการรักษา',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                children: [
                                  Text(
                                    (_patient != null &&
                                            _patient!.beforecure.isNotEmpty)
                                        ? _patient!.beforecure
                                        : 'ไม่ได้ระบุ',
                                    style: TextStyle(fontSize: height * 0.02),
                                  ),
                                ],
                              ),
                              Divider(),
                              Text(
                                'หลังการรักษา',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                children: [
                                  Text(
                                    (_patient != null &&
                                            _patient!.aftercure.isNotEmpty)
                                        ? _patient!.aftercure
                                        : 'ไม่ได้ระบุ',
                                    style: TextStyle(fontSize: height * 0.02),
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        SizedBox(height: height * 0.04),
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: const Color(0xFF82B1FF),
            child: const Icon(Icons.send),
            onPressed: () async {
// สร้างไฟล์ใน directory ของแอป
              final directory = await getApplicationDocumentsDirectory();

// ตั้งชื่อไฟล์ให้ชัดเจน
              final fileName =
                  'Patient_Info_${_patient?.nameController ?? 'Unknown'}.txt';
              final path = '${directory.path}/$fileName';
              final file = File(path);

// เขียนข้อความลงในไฟล์
              await file.writeAsString(patientDetails);

// แชร์ไฟล์ที่มีชื่อที่ตั้งไว้โดยใช้ shareXFiles
              await Share.shareXFiles(
                [XFile(file.path)],
                text: 'ดูข้อมูลผู้ป่วยที่นี่',
                subject: 'ข้อมูลผู้ป่วย',
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget buildRow(double height, double width, String text, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height * 0.01),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: height * 0.018,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: width * 0.05),
        Text(
          value,
          style: TextStyle(
            fontSize: height * 0.018,
          ),
        ),
      ],
    ),
  );
}
