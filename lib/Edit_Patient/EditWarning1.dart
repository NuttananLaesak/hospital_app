import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/Edit_Patient/EditWarning2.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_Indications1.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_Indications2.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_Indications3.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited1.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited10.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited11.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited12.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited13.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited14.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited2.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited3.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited4.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited5.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited6.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited7.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited8.dart';
import 'package:hospital_app/StrictlyProhibite_Edit.dart/Edit_StrictlyProhibited9.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditWarning1 extends StatefulWidget {
  final int patientId;

  const EditWarning1({Key? key, required this.patientId}) : super(key: key);

  @override
  State<EditWarning1> createState() => _EditWarning1State();
}

class _EditWarning1State extends State<EditWarning1> {
  int indications1 = -1;
  int indications2 = -1;
  int indications3 = -1;
  int strictlyprohibited1 = -1;
  int strictlyprohibited2 = -1;
  int strictlyprohibited3 = -1;
  int strictlyprohibited4 = -1;
  int strictlyprohibited5 = -1;
  int strictlyprohibited6 = -1;
  int strictlyprohibited7 = -1;
  int strictlyprohibited8 = -1;
  int strictlyprohibited9 = -1;
  int strictlyprohibited10 = -1;
  int strictlyprohibited11 = -1;
  int strictlyprohibited12 = -1;
  int strictlyprohibited13 = -1;
  int strictlyprohibited14 = -1;

// ignore: unused_field
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
          indications1 = patient.indications1;
          indications2 = patient.indications2;
          indications3 = patient.indications3;
          strictlyprohibited1 = patient.strictlyprohibited1;
          strictlyprohibited2 = patient.strictlyprohibited2;
          strictlyprohibited3 = patient.strictlyprohibited3;
          strictlyprohibited4 = patient.strictlyprohibited4;
          strictlyprohibited5 = patient.strictlyprohibited5;
          strictlyprohibited6 = patient.strictlyprohibited6;
          strictlyprohibited7 = patient.strictlyprohibited7;
          strictlyprohibited8 = patient.strictlyprohibited8;
          strictlyprohibited9 = patient.strictlyprohibited9;
          strictlyprohibited10 = patient.strictlyprohibited10;
          strictlyprohibited11 = patient.strictlyprohibited11;
          strictlyprohibited12 = patient.strictlyprohibited12;
          strictlyprohibited13 = patient.strictlyprohibited13;
          strictlyprohibited14 = patient.strictlyprohibited14;
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
          automaticallyImplyLeading: true,
          title: Text(
            'เเก้ไขข้อมูลผู้ป่วย',
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
          children: <Widget>[
            SizedBox(height: height * 0.03),
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 192, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'ข้อบ่งชี้',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.04),
                        EditIndictions2(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              indications2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditIndications1(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              indications1 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditIndictions3(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              indications3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 192, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          "ข้อห้ามอย่างเด็ดขาด",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        EditStrictly_Prohibited7(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited7 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited3(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited4(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited4 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited1(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited1 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited9(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited9 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited12(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited12 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited13(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited13 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited14(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited14 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited11(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited11 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited10(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited10 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited6(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited6 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited8(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited8 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited2(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        EditStrictly_Prohibited5(
                          patientId: widget.patientId,
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited5 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditWarning2(
                          patientId: widget.patientId,
                          indications1: indications1,
                          indications2: indications2,
                          indications3: indications3,
                          strictlyprohibited1: strictlyprohibited1,
                          strictlyprohibited2: strictlyprohibited2,
                          strictlyprohibited3: strictlyprohibited3,
                          strictlyprohibited4: strictlyprohibited4,
                          strictlyprohibited5: strictlyprohibited5,
                          strictlyprohibited6: strictlyprohibited6,
                          strictlyprohibited7: strictlyprohibited7,
                          strictlyprohibited8: strictlyprohibited8,
                          strictlyprohibited9: strictlyprohibited9,
                          strictlyprohibited10: strictlyprohibited10,
                          strictlyprohibited11: strictlyprohibited11,
                          strictlyprohibited12: strictlyprohibited12,
                          strictlyprohibited13: strictlyprohibited13,
                          strictlyprohibited14: strictlyprohibited14,
                        ),
                      ),
                    );
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
                    'หน้าถัดไป',
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
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
