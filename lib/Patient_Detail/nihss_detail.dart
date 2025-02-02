import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_app/Edit_Patient/EditNihss1.dart';
import 'package:hospital_app/Edit_Patient/EditNihss10.dart';
import 'package:hospital_app/Edit_Patient/EditNihss11.dart';
import 'package:hospital_app/Edit_Patient/EditNihss12.dart';
import 'package:hospital_app/Edit_Patient/EditNihss13.dart';
import 'package:hospital_app/Edit_Patient/EditNihss14.dart';
import 'package:hospital_app/Edit_Patient/EditNihss15.dart';
import 'package:hospital_app/Edit_Patient/EditNihss2.dart';
import 'package:hospital_app/Edit_Patient/EditNihss3.dart';
import 'package:hospital_app/Edit_Patient/EditNihss4.dart';
import 'package:hospital_app/Edit_Patient/EditNihss5.dart';
import 'package:hospital_app/Edit_Patient/EditNihss6.dart';
import 'package:hospital_app/Edit_Patient/EditNihss7.dart';
import 'package:hospital_app/Edit_Patient/EditNihss8.dart';
import 'package:hospital_app/Edit_Patient/EditNihss9.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NihssDetail extends StatefulWidget {
  final int patientId;

  const NihssDetail({Key? key, required this.patientId}) : super(key: key);

  @override
  State<NihssDetail> createState() => _NihssDetailState();
}

class _NihssDetailState extends State<NihssDetail> {
  int _totalScore = 0;

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
          _totalScore = patient.totalScore;
        });
        break;
      }
    }
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
            'NIHSS',
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
                            'NIHSS ${_patient?.totalScore} คะเเนน',
                            style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                              color: _totalScore == 0
                                  ? Colors.green
                                  : (_totalScore >= 1 && _totalScore <= 4)
                                      ? Colors.yellow[600]
                                      : (_totalScore >= 5 && _totalScore <= 15)
                                          ? Colors.orange
                                          : (_totalScore >= 16 &&
                                                  _totalScore <= 20)
                                              ? Colors.amber[900]
                                              : (_totalScore >= 21)
                                                  ? Colors.red
                                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${_patient?.nihssLevel}',
                            style: TextStyle(
                              fontSize: height * 0.022,
                              fontWeight: FontWeight.bold,
                              color: _totalScore == 0
                                  ? Colors.green
                                  : (_totalScore >= 1 && _totalScore <= 4)
                                      ? Colors.yellow[600]
                                      : (_totalScore >= 5 && _totalScore <= 15)
                                          ? Colors.orange
                                          : (_totalScore >= 16 &&
                                                  _totalScore <= 20)
                                              ? Colors.amber[900]
                                              : (_totalScore >= 21)
                                                  ? Colors.red
                                                  : Colors.black,
                            ),
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            '*หากข้อการเเก้ไขข้อใหนให้เลือกข้อนั้น*',
                            style: TextStyle(
                                fontSize: height * 0.02,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'คำตอบ',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'คะเเนน',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss1(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 1a',
                              '${_patient?.selectedText1}',
                              '${_patient?.selectedScore1}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss2(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 1b',
                              '${_patient?.selectedText2}',
                              '${_patient?.selectedScore2}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss3(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 1c',
                              '${_patient?.selectedText3}',
                              '${_patient?.selectedScore3}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss4(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 2 ',
                              '${_patient?.selectedText4}',
                              '${_patient?.selectedScore4}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss5(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 3 ',
                              '${_patient?.selectedText5}',
                              '${_patient?.selectedScore5}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss6(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 4 ',
                              '${_patient?.selectedText6}',
                              '${_patient?.selectedScore6}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss7(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 5a',
                              '${_patient?.selectedText7}',
                              '${_patient?.selectedScore7}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss8(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 5b',
                              '${_patient?.selectedText8}',
                              '${_patient?.selectedScore8}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss9(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 6a',
                              '${_patient?.selectedText9}',
                              '${_patient?.selectedScore9}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss10(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 6b',
                              '${_patient?.selectedText10}',
                              '${_patient?.selectedScore10}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss11(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 7 ',
                              '${_patient?.selectedText11}',
                              '${_patient?.selectedScore11}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss12(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 8 ',
                              '${_patient?.selectedText12}',
                              '${_patient?.selectedScore12}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss13(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 9 ',
                              '${_patient?.selectedText13}',
                              '${_patient?.selectedScore13}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss14(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 10',
                              '${_patient?.selectedText14}',
                              '${_patient?.selectedScore14}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss15(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((_) {
                                loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 11',
                              '${_patient?.selectedText15}',
                              '${_patient?.selectedScore15}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          SizedBox(height: height * 0.01),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}

Widget buildRow(
    double height, double width, String label, String text, String score) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height * 0.01),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            '$label $text',
            style: TextStyle(
              fontSize: height * 0.018,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: width * 0.05),
        Text(
          score,
          style: TextStyle(
            fontSize: height * 0.018,
          ),
        ),
      ],
    ),
  );
}
