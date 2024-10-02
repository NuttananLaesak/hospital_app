import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/Edit_Patient/EditWarning1.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WarningDetail extends StatefulWidget {
  final int patientId;

  const WarningDetail({Key? key, required this.patientId}) : super(key: key);

  @override
  State<WarningDetail> createState() => _WarningDetailState();
}

class _WarningDetailState extends State<WarningDetail> {
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

    String checkIndication(int? value) {
      if (value == null) {
        return 'ไม่ได้ระบุ';
      }
      switch (value) {
        case 0:
          return 'ไม่มี';
        case 1:
          return 'มี';
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ข้อบ่งชี้/ข้อห้าม',
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
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อบ่งชี้',
                            style: TextStyle(
                              fontSize: height * 0.024,
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
                            'มีอายุเท่ากับหรือมากกว่า 18 ปี',
                            checkIndication(_patient?.indications2),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีอาการของหลอดเลือดสมองตีบ\nภายในระยะเวลา 4.5 ชั่วโมงหรือไม่',
                            checkIndication(_patient?.indications1),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'ผล CT brain ไม่พบว่ามีเลือดออกในเนื้อสมองหรือชั้นใต้เยื่อหุ้มสมอง',
                            checkIndication(_patient?.indications3),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อห้ามอย่างเด็ดขาด',
                            style: TextStyle(
                              fontSize: height * 0.024,
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
                            'มีความดันโลหิตช่วงก่อนให้รักษาสูง\n(SBP > 185 mm/Hg) (DBP > 110 mm/Hg)\nเเละไม่สามารถลดความดันโลหิตลงได้ก่อนให้ยาละลายลิ่มเลือด',
                            checkProhibited(_patient?.strictlyprohibited7),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีประวัติเลือดออกในสมองมาก่อน',
                            checkProhibited(_patient?.strictlyprohibited3),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีเนื้องอกในสมอง',
                            checkProhibited(_patient?.strictlyprohibited4),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีอาการบาดเจ็บที่ศรีษะอย่างรุนเเรงหรือมีประวัติเป็นโรคหลอดเลือดสมองภายใน 3 เดือน',
                            checkProhibited(_patient?.strictlyprohibited1),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีประวัติได้รับยาต้านการเเข็งตัวของเลือดโดยมีค่า PT > 15 วินาที หรือมีค่า INR > 1.7',
                            checkProhibited(_patient?.strictlyprohibited9),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีประวัติได้รับยาเเละผลตรวจดังนี้\nได้รับยากลุ่ม Non vitamin K antagonist oral anticoagullant',
                            checkProhibited(_patient?.strictlyprohibited12),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'ได้รับยา heparin ภายใน 48 ชั่วโมงเเละมีค่า partial-thromboplastin time ผิดปกติ',
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
                            'มีภาวะเลือดออกเเละอวัยวะภายใน',
                            checkProhibited(_patient?.strictlyprohibited8),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีประวัติสงสัยภาวะเลือดออก\nชั้นใต้เยื่อหุ้มสมอง',
                            checkProhibited(_patient?.strictlyprohibited2),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีการเเทงหลอกเลือดเเดงขนาดใหญ่\nในตำเเหน่งที่ไม่สามารถกดได้ภายใน 7 วัน',
                            checkProhibited(_patient?.strictlyprohibited5),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อห้ามที่ไม่ถือว่าห้ามอย่างเด็ดขาด',
                            style: TextStyle(
                              fontSize: height * 0.024,
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
                            'มีอาการทางประสาทดีขึ้นอย่างรวดเร็วจนเกือบเป็นปกติหรือมีอาการอย่างเดียวไม่รุนเเรง',
                            checkProhibited(_patient?.strictlynotprohibited1),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีอาการชักตอนเริ่มต้นเเละภายหลังจากชักยังมีอาการอ่อนเเรงอยู่',
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
                            'มีประวัติ Recent Myocardial Infracytion ภายใน 3 เดือน',
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
                            checkProhibited(
                              (_patient?.additionalprohibitions2),
                            ),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'NIHSS มากกว่า 25 คะเเนน',
                            checkProhibited(
                              (_patient?.additionalprohibitions1),
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.07),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: height * 0.08,
        height: height * 0.1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF82B1FF),
              Color(0xFF82B1FF),
            ],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditWarning1(
                    patientId: widget.patientId,
                  ),
                ),
              ).then((_) {
                loadPatientData();
              });
            },
            borderRadius: BorderRadius.circular(height * 0.076 / 2),
            child: Center(
              child: Icon(
                Icons.edit_document,
                color: Colors.black,
                size: width * 0.095,
              ),
            ),
          ),
        ),
      ),
    );
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
}
