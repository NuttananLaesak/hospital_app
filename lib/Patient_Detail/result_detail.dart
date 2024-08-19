import 'package:flutter/material.dart';
import 'package:hospital_app/sql_lite.dart';
import 'package:share_plus/share_plus.dart';

class ResultDetail extends StatefulWidget {
  final int patientID;

  const ResultDetail({Key? key, required this.patientID}) : super(key: key);

  @override
  State<ResultDetail> createState() => _ResultDetailState();
}

class _ResultDetailState extends State<ResultDetail> {
  Map<String, dynamic>? patient;
  final SqllLiteManage _databaseManager = SqllLiteManage();
  bool showMedicationError = false;

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
        patient = result.first;
      });
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

    void _calculateWeight() {
      if (patient?['Indications1'] == 1 &&
          patient?['Indications2'] == 1 &&
          patient?['Indications3'] == 1 &&
          patient?['StrictlyProhibited1'] == 1 &&
          patient?['StrictlyProhibited2'] == 1 &&
          patient?['StrictlyProhibited3'] == 1 &&
          patient?['StrictlyProhibited4'] == 1 &&
          patient?['StrictlyProhibited5'] == 1 &&
          patient?['StrictlyProhibited6'] == 1 &&
          patient?['StrictlyProhibited7'] == 1 &&
          patient?['StrictlyProhibited8'] == 1 &&
          patient?['StrictlyProhibited9'] == 1 &&
          patient?['StrictlyProhibited10'] == 1 &&
          patient?['StrictlyProhibited11'] == 1 &&
          patient?['AdditionalProhibitions1'] == 1) {
        setState(() {
          showMedicationError = false;
        });
      } else {
        setState(() {
          showMedicationError = true;
        });
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'รายงานผล',
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
                          'ชื่อ : ${patient?['PatientName']?.isNotEmpty == true ? patient!['PatientName'] : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'โรงพยาบาล : ${patient?['Hospital']?.isNotEmpty == true ? patient!['Hospital'] : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'อายุ : ${patient?['Age'] == null ? 'ไม่ได้ระบุ' : patient!['Age'] == 0 ? 'ไม่ได้ระบุ' : patient!['Age']} ปี',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'เพศ : ${patient?['Gender']?.isNotEmpty == true ? patient!['Gender'] : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'น้ำหนัก : ${patient?['Weight']?.isNotEmpty == true ? patient!['Weight'] : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'ความดันโลหิต : ${patient?['SystolicBloodPressure'] ?? 'ไม่ระบุ'}/${patient?['DiastolicBloodPressure'] ?? 'ไม่ระบุ'} (mmHg)',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'ระดับน้ำตาลในเลือด : ${patient?['Sugar']?.isNotEmpty == true ? patient!['Sugar'] : 'ไม่ได้ระบุ'} (mg/dl)',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'โรคประจำตัว : ${patient?['SelectedDiseases']?.isNotEmpty == true ? patient!['SelectedDiseases'] : 'ไม่ได้ระบุ'}',
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
                              'CT Brain : ',
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                            Text(
                              ctbrainText(patient?['CTBrain']),
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
                          '${patient?['DateTime1']?.isNotEmpty == true ? patient!['DateTime1'] : 'ไม่ได้ระบุ'}',
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
                          '${patient?['DateTime2']?.isNotEmpty == true ? patient!['DateTime2'] : 'ไม่ได้ระบุ'}',
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
                          '${patient?['DateTime3']?.isNotEmpty == true ? patient!['DateTime3'] : 'ไม่ได้ระบุ'}',
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
                          'ระยะเวลาเมีออาการมาโรงพยาบาล\nใช้เวลา ${patient?['TimeDifference1'].toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(),
                        Text(
                          'ระยะเวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา\nใช้เวลา ${patient?['TimeDifference2'].toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง',
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
                              CheckSymptom1(patient?['SymptomHead']),
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
                              CheckSymptom1(patient?['SymptomEye']),
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
                              CheckSymptom2(patient?['SymptomFace'] ?? -1),
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
                              CheckSymptom2(patient?['SymptomArm'] ?? -1),
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
                              CheckSymptom1(patient?['SymptomSpeech']),
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
                              CheckSymptom3(patient?['SymptomVisual'] ?? -1),
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
                              CheckSymptom4(patient?['SymptomAphasia'] ?? -1),
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
                              CheckSymptom1(patient?['SymptomNeglect']),
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
                          'NIHSS : ${patient?['TotalScore']} คะเเนน',
                          style: TextStyle(
                            fontSize: height * 0.02,
                          ),
                        ),
                        Divider(),
                        Text(
                          'ระดับความรุนเเรง ${patient?['NIHSSLevel']}',
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
                          'มีอาการของหลอดเลือดสมองตีบภายในระยะเวลา 4.5 ชั่วโมง\n',
                          checkIndication(patient?['Indications1']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีอายุเท่ากับหรือมากกว่า 18 ปี',
                          checkIndication(patient?['Indications2']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'ผล CT brain ไม่พบว่ามีเลือดออกในเนื้อสมองหรือชั้นใต้เยื่อหุ้มสมอง',
                          checkIndication(patient?['Indications3']),
                        ),
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
                          'มีอาการบาดเจ็บที่ศรีษะอย่างรุนเเรงหรือมีประวัติเป็นโรคหลอดเลือดสมองใน 3 เดือน',
                          checkProhibited(patient?['StrictlyProhibited1']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีอาการสงสัยว่ามีเลือดออกชั้นใต้ของ\nเยื่อหุ้มสมอง',
                          checkProhibited(patient?['StrictlyProhibited2']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีประวัติเคยมีเลือดออกในกระโหลกศรีษะ',
                          checkProhibited(patient?['StrictlyProhibited3']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีเนื้องอกในสมอง , Aneuysm, Arteriovenous Malformation',
                          checkProhibited(patient?['StrictlyProhibited4']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีการเเทงหลอกเลือดเเดงขนาดใหญ่ในตำเเหน่งที่ไม่สามารถกดได้ภายใน7วัน',
                          checkProhibited(patient?['StrictlyProhibited5']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีการได้รับการผ่าตัดกระโหลกศรีษะหรือกระดูกสันหลังภายใน 3 เดือน',
                          checkProhibited(patient?['StrictlyProhibited6']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีความดันโลหิตสูงเเละไม่สามารถลดความดันโลหิตลงได้ก่อนให้ยาละลายลิ่มเลือด',
                          checkProhibited(patient?['StrictlyProhibited7']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีผลการตรวจร่างกายพบว่ามีภาวะเลือดออก (Active Bleeding)',
                          checkProhibited(patient?['StrictlyProhibited8']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีภาวะเลือดออกง่าย',
                          checkProhibited(patient?['StrictlyProhibited9']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีระดับน้ำตาลในเลือดเท่ากับหรือ\nน้อยกว่า 50 mg/dl',
                          checkProhibited(patient?['StrictlyProhibited10']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'CT brain พบมีสมองขาดเลือดมากกว่าขนาด 1/3 ชอง cerebral hemisphere',
                          checkProhibited(patient?['StrictlyProhibited11']),
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
                          checkProhibited(patient?['StrictlyNotProhibited1']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีการตั้งครรภ์',
                          checkProhibited(patient?['StrictlyNotProhibited2']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีอาการชักตอนเริ่มต้นเเละภายหลังจากชักยังมีอาการอ่อนเเรงอยู่',
                          checkProhibited(patient?['StrictlyNotProhibited3']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'เคยมีประวัติการผ่าตัดใหญ่หรือ\nมีอุบัติเหตุรุนเเรงภายใน 14 วัน',
                          checkProhibited(patient?['StrictlyNotProhibited4']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีเลือดออกในทางเดินอาหารหรือ\nทางเดินปัสสสาวะภายใน 21 วัน',
                          checkProhibited(patient?['StrictlyNotProhibited5']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีประวัติ Recent Myocardial Infracytion ภายใน 3 เดือน',
                          checkProhibited(patient?['StrictlyNotProhibited6']),
                        ),
                        Divider(),
                        SizedBox(height: height * 0.04),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        Text(
                          'ข้อห้ามเพิ่มเติมในกรณีผู้ป่วยมีอาการมากกว่า 3 - 4.5 ชั่วโมง',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: Color(0xFF82B1FF),
                          thickness: 2.0,
                        ),
                        buildRow(
                          height,
                          width,
                          'NIHSS มากกว่า 25 คะเเนน',
                          checkProhibited(patient?['AdditionalProhibitions1']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'เป็นเบาหวานร่วมกับเคยมีโรคหลอดเลือดสมองอุดตันมาก่อน',
                          checkProhibited(patient?['AdditionalProhibitions2']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีอายุมากกว่า 80 ปี',
                          checkProhibited(patient?['AdditionalProhibitions3']),
                        ),
                        Divider(),
                        buildRow(
                          height,
                          width,
                          'มีประวัติได้รับยาละลายลิ่มเลือด \n(Warfarin) โดยไม่พิจารณา INR',
                          checkProhibited(patient?['AdditionalProhibitions4']),
                        ),
                        Divider(),
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
                                'ปริมาณยาละลายลิ่มเลือด\n(rt-PA) ${patient?['Medic1']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม',
                                style: TextStyle(fontSize: height * 0.02),
                                textAlign: TextAlign.center,
                              ),
                              Divider(),
                              Text(
                                'แบ่งให้ ${patient?['Medic2']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม\nทางหลอดเลือดใน 1 นาที',
                                style: TextStyle(fontSize: height * 0.02),
                                textAlign: TextAlign.center,
                              ),
                              Divider(),
                              Text(
                                'และ ${patient?['Medic3']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม\nหยดทางหลอดเลือดใน 60 นาที',
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
                                    (patient != null &&
                                            patient!['BeforeCure'] != null &&
                                            patient!['BeforeCure'].isNotEmpty)
                                        ? patient!['BeforeCure']
                                        : 'ไม่ระบุ',
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
                                    (patient != null &&
                                            patient!['AfterCure'] != null &&
                                            patient!['AfterCure'].isNotEmpty)
                                        ? patient!['AfterCure']
                                        : 'ไม่ระบุ',
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF82B1FF),
        child: const Icon(Icons.send),
        onPressed: () async {
          if (patient != null) {
            String patientDetails = '''
ข้อมูลผู้ป่วยโรคหลอดเลือดสมอง

ข้อมูลเบื้องต้น
ชื่อ: ${patient?['PatientName']?.isNotEmpty == true ? patient!['PatientName'] : 'ไม่ได้ระบุ'}
โรงพยาบาล: ${patient?['Hospital']?.isNotEmpty == true ? patient!['Hospital'] : 'ไม่ได้ระบุ'}
อายุ: ${patient?['Age'] == null ? 'ไม่ได้ระบุ' : patient!['Age'] == 0 ? 'ไม่ได้ระบุ' : patient!['Age']} ปี
เพศ: ${patient?['Gender']?.isNotEmpty == true ? patient!['Gender'] : 'ไม่ได้ระบุ'}
น้ำหนัก: ${patient?['Weight']?.isNotEmpty == true ? patient!['Weight'] : 'ไม่ได้ระบุ'}' กิโลกรัม
ความดันโลหิต: ${patient!['SystolicBloodPressure'] ?? 'ไม่ระบุ'}/${patient!['DiastolicBloodPressure'] ?? 'ไม่ระบุ'} (mg/dl)
ระดับน้ำตาลในเลือด: ${patient?['Sugar']?.isNotEmpty == true ? patient!['Sugar'] : 'ไม่ได้ระบุ'} (mg/dl)
โรคประจำตัว: ${patient?['SelectedDiseases']?.isNotEmpty == true ? patient!['SelectedDiseases'] : 'ไม่ได้ระบุ'}
CT Brain: ${ctbrainText(patient?['CTBrain'])}

วันที่เเละเวลาที่บันทึกข้อมูล
เวลาที่เริ่มมีอาการ
${patient?['DateTime1']?.isNotEmpty == true ? patient!['DateTime1'] : 'ไม่ได้ระบุ'}
เวลาที่มาถึงโรงพยาบาล
${patient?['DateTime2']?.isNotEmpty == true ? patient!['DateTime2'] : 'ไม่ได้ระบุ'}
เวลาที่ใช้ยาละลายลิ่มเลือด
${patient?['DateTime3']?.isNotEmpty == true ? patient!['DateTime3'] : 'ไม่ได้ระบุ'}

ระยะเวลาที่ใช้
ระยะเวลาเมื่อมีอาการมาโรงพยาบาล
ใช้เวลา ${patient?['TimeDifference1']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง'
ระยะเวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา
ใช้เวลา ${patient?['TimeDifference2']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง'
      
อาการ
1. เวียนศรีษะ เดินเซ: ${CheckSymptom1(patient?['SymptomHead'])}
2. อาการตาดับทันทีทันใด: ${CheckSymptom1(patient?['SymptomEye'])} 
3. หน้าเบี้ยวฉียบพลัน: ${CheckSymptom2(patient?['SymptomFace'] ?? -1)}
4. อ่อนแอแขน/ขาเฉียบพลัน: ${CheckSymptom2(patient?['SymptomArm'] ?? -1)}
5. พูดลำบาก/พูดไม่ชัด: ${CheckSymptom1(patient?['SymptomSpeech'])}
6. การมองเห็น: ${CheckSymptom3(patient?['SymptomVisual'] ?? -1)}
7. การเข้าใจภาษา: ${CheckSymptom4(patient?['SymptomAphasia'] ?? -1)}
8. ไม่สนใจร่างกายหนึ่งด้าน: ${CheckSymptom1(patient?['SymptomNeglect'])}

การให้ยาผู้ป่วย
ปริมาณยาละลายลิ่มเลือด
(rt-PA) ${patient?['Medic1']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม
แบ่งให้ ${patient?['Medic2']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม
ทางหลอดเลือดใน 1 นาที'
'และ ${patient?['Medic3']?.toStringAsFixed(2) ?? 'ไม่ระบุ'} มิลลิกรัม
หยดทางหลอดเลือดใน 60 นาที',

ผลการรักษา
ก่อนการรักษา
${patient?['BeforeCure'] ?? 'ไม่ระบุ'}
หลังการรักษา
${patient?['BeforeCure'] ?? 'ไม่ระบุ'}
      ''';
            await Share.share(patientDetails);
          } else {
            await Share.share('ไม่มีข้อมูลผู้ป่วย');
          }
        },
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
