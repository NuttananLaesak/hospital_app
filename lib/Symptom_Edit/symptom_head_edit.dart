import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SymptomHeadEdit extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int patientId;

  const SymptomHeadEdit(
      {Key? key, required this.onChanged, required this.patientId})
      : super(key: key);

  @override
  State<SymptomHeadEdit> createState() => _SymptomHeadEditState();
}

class _SymptomHeadEditState extends State<SymptomHeadEdit> {
  int symptomHead = -1;

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
          symptomHead = patient.symptomHead;
        });
        break;
      }
    }
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
            'Balance : เวียนศรีษะ เดินเซ',
            style: TextStyle(fontSize: height * 0.019),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: symptomHead == 1,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomHead = value! ? 1 : -1;
                    widget.onChanged(symptomHead);
                  });
                },
              ),
              Text(
                'มี',
                style: TextStyle(fontSize: height * 0.018),
              ),
              SizedBox(width: width * 0.04),
              Checkbox(
                value: symptomHead == 0,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomHead = value! ? 0 : -1;
                    widget.onChanged(symptomHead);
                  });
                },
              ),
              Text(
                'ไม่มี',
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
