import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/Patient_Detail/cure_detail.dart';
import 'package:hospital_app/Patient_Detail/madic_detail.dart';
import 'package:hospital_app/Patient_Detail/nihss_detail.dart';
import 'package:hospital_app/Patient_Detail/patient_detail.dart';
import 'package:hospital_app/Patient_Detail/result_detail.dart';
import 'package:hospital_app/Patient_Detail/warning_detail.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPatient extends StatefulWidget {
  final int patientId;

  const DashboardPatient({Key? key, required this.patientId}) : super(key: key);

  @override
  State<DashboardPatient> createState() => _DashboardPatientState();
}

class _DashboardPatientState extends State<DashboardPatient> {
  late double height;
  late double width;

  Patient? _patient;

  @override
  void initState() {
    super.initState();
    loadPatientData();

    pageLink = [
      (BuildContext context) => PatientDetail(patientId: widget.patientId),
      (BuildContext context) => NihssDetail(patientId: widget.patientId),
      (BuildContext context) => WarningDetail(patientId: widget.patientId),
      (BuildContext context) => MadicDetail(patientId: widget.patientId),
      (BuildContext context) => CureDetial(patientId: widget.patientId),
      (BuildContext context) => ResultDetail(patientId: widget.patientId),
    ];
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

  List<String> menuName = [
    "ประวัติผู้ป่วย",
    "NIHSS",
    "ข้อบ่งชี/ข้อห้าม",
    "ปริมาณยา",
    "ผลการรักษา",
    "รายงานผล",
  ];

  List<String> menuIcon = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png',
    'images/5.png',
    'images/6.png',
  ];

  late List<Widget Function(BuildContext)> pageLink;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    if (_patient == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [Color(0xFF82B1FF), Color(0xFF82B1FF)],
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                automaticallyImplyLeading: true,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'รายละเอียดผู้ป่วย',
                  style: TextStyle(
                      fontSize: height * 0.028,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                height: height * 0.28,
                width: width,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.01),
                      Image.asset('images/dash.png',
                          width: width * 0.4, height: height * 0.2),
                      SizedBox(height: height * 0.01),
                      Text(
                          'ชื่อ : ${_patient!.nameController.isNotEmpty == true ? _patient!.nameController : 'ไม่ได้ระบุ'}',
                          style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                          itemCount: menuName.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                pageLink[index](context)))
                                    .then((_) {
                                  loadPatientData();
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: Center(
                                        child: Image.asset(menuIcon[index])),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(menuName[index],
                                      style: TextStyle(
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
