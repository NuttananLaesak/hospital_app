import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_app/Edit_Patient/EditPatient1.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDetail extends StatefulWidget {
  final int patientId;

  const PatientDetail({Key? key, required this.patientId}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
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
        case 4:
          return 'Intracerebral Hemorrhage';
        case 5:
          return '${_patient?.ctBrainText}';
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
            'ประวัติผู้ป่วย',
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
                            'น้ำหนัก : ${_patient?.weightController.isNotEmpty == true ? _patient!.weightController : 'ไม่ได้ระบุ'} กิโลกรัม',
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
                            'ระยะเวลาเมีอมีอาการมาโรงพยาบาล\nใช้เวลา ${_patient?.timeDifference1!.toInt()} ชั่วโมง ${_patient?.timeDifference1!.toStringAsFixed(2).substring(2)} นาที',
                            style: TextStyle(
                              fontSize: height * 0.02,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(),
                          Text(
                            'ระยะเวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา\nใช้เวลา ${_patient?.timeDifference2!.toInt()} ชั่วโมง ${_patient?.timeDifference2!.toStringAsFixed(2).substring(2)} นาที',
                            // 'ระยะเวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา\nใช้เวลา ${_patient?.timeDifference2!.toStringAsFixed(2) ?? 'ไม่ระบุ'} ชั่วโมง',
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
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
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
                  builder: (context) => EditPatient1(
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
}
