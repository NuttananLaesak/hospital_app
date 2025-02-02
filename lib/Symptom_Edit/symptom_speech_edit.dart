import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SymptomSpeechEdit extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int patientId;

  const SymptomSpeechEdit(
      {Key? key, required this.onChanged, required this.patientId})
      : super(key: key);

  @override
  State<SymptomSpeechEdit> createState() => _SymptomSpeechEditState();
}

class _SymptomSpeechEditState extends State<SymptomSpeechEdit> {
  int symptomSpeech = -1;

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
          symptomSpeech = patient.symptomSpeech;
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
            'Speech : พูดลำบาก/พูดไม่ชัด/\nนึกคำพูดไม่ออกเฉียบพลัน',
            style: TextStyle(fontSize: height * 0.019),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: symptomSpeech == 1,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomSpeech = value! ? 1 : -1;
                    widget.onChanged(symptomSpeech);
                  });
                },
              ),
              Text(
                'มี',
                style: TextStyle(fontSize: height * 0.018),
              ),
              SizedBox(width: width * 0.04),
              Checkbox(
                value: symptomSpeech == 0,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomSpeech = value! ? 0 : -1;
                    widget.onChanged(symptomSpeech);
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
