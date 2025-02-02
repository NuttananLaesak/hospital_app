import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SymptomFaceEdit extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int patientId;

  const SymptomFaceEdit(
      {Key? key, required this.onChanged, required this.patientId})
      : super(key: key);

  @override
  State<SymptomFaceEdit> createState() => _SymptomFaceEditState();
}

class _SymptomFaceEditState extends State<SymptomFaceEdit> {
  int symptomFace = -1;

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
          symptomFace = patient.symptomEye;
        });
        break;
      }
    }
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (symptomFace == index) {
        symptomFace = -1;
      } else {
        symptomFace = index;
      }
      widget.onChanged(symptomFace);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.02),
          Text(
            'Face : หน้าเบี้ยวฉียบพลัน',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: symptomFace == 0,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  _handleCheckboxChange(0);
                },
              ),
              Text(
                'ปกติ',
                style: TextStyle(fontSize: height * 0.018),
              ),
              SizedBox(width: width * 0.04),
              Checkbox(
                value: symptomFace == 1,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  _handleCheckboxChange(1);
                },
              ),
              Text(
                'ซ้าย',
                style: TextStyle(fontSize: height * 0.018),
              ),
              SizedBox(width: width * 0.04),
              Checkbox(
                value: symptomFace == 2,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  _handleCheckboxChange(2);
                },
              ),
              Text(
                'ขวา',
                style: TextStyle(fontSize: height * 0.018),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
