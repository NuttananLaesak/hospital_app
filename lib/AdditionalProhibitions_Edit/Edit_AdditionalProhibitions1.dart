import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAdditionalProhibitions1 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int patientId;

  const EditAdditionalProhibitions1(
      {Key? key, required this.onChanged, required this.patientId})
      : super(key: key);

  @override
  State<EditAdditionalProhibitions1> createState() =>
      _EditAdditionalProhibitions1State();
}

class _EditAdditionalProhibitions1State
    extends State<EditAdditionalProhibitions1> {
  int additionalprohibitions1 = -1;

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
          additionalprohibitions1 = patient.additionalprohibitions1;
        });
        break;
      }
    }
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (additionalprohibitions1 == index) {
        additionalprohibitions1 = -1;
      } else {
        additionalprohibitions1 = index;
      }
      widget.onChanged(additionalprohibitions1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              Text(
                'มีคะเเนน NIHSS มากกว่า 25 คะเเนน',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: additionalprohibitions1 == 0,
                    activeColor: Color(0xFF304FFE),
                    onChanged: (value) {
                      _handleCheckboxChange(0);
                    },
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: additionalprohibitions1 == 1,
                    activeColor: Color(0xFF304FFE),
                    onChanged: (value) {
                      _handleCheckboxChange(1);
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
        ),
      ],
    );
  }
}
