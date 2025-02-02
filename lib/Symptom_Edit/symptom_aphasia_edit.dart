import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SymptomAphasiaEdit extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int patientId;

  const SymptomAphasiaEdit(
      {Key? key, required this.onChanged, required this.patientId})
      : super(key: key);

  @override
  State<SymptomAphasiaEdit> createState() => _SymptomAphasiaEditState();
}

class _SymptomAphasiaEditState extends State<SymptomAphasiaEdit> {
  int symptomAphasia = -1;

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
          symptomAphasia = patient.symptomAphasia;
        });
        break;
      }
    }
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (symptomAphasia == index) {
        symptomAphasia = -1;
      } else {
        symptomAphasia = index;
      }
      widget.onChanged(symptomAphasia);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.02),
          Text(
            'Aphasia : การเข้าใจภาษา',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: symptomAphasia == 0,
                        activeColor: Color(0xFF304FFE),
                        onChanged: (value) {
                          _handleCheckboxChange(0);
                        },
                      ),
                      Text(
                        'ปกติ                                                     ',
                        style: TextStyle(fontSize: height * 0.018),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: symptomAphasia == 1,
                        activeColor: Color(0xFF304FFE),
                        onChanged: (value) {
                          _handleCheckboxChange(1);
                        },
                      ),
                      Text(
                        'ไม่พูดเเต่ทำตามคำสั่งได้ถูกต้อง          ',
                        style: TextStyle(fontSize: height * 0.018),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: symptomAphasia == 2,
                        activeColor: Color(0xFF304FFE),
                        onChanged: (value) {
                          _handleCheckboxChange(2);
                        },
                      ),
                      Text(
                        'ไม่พูดเเละไม่ทำตามคำสั่ง                    ',
                        style: TextStyle(fontSize: height * 0.018),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: symptomAphasia == 3,
                        activeColor: Color(0xFF304FFE),
                        onChanged: (value) {
                          _handleCheckboxChange(3);
                        },
                      ),
                      Text(
                        'ตอบไม่ตรงคำถามเเละไม่ทำตามคำสั่ง',
                        style: TextStyle(fontSize: height * 0.018),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
