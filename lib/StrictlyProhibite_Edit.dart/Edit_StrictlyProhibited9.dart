import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditStrictly_Prohibited9 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int patientId;

  const EditStrictly_Prohibited9(
      {Key? key, required this.onChanged, required this.patientId})
      : super(key: key);

  @override
  State<EditStrictly_Prohibited9> createState() =>
      _EditStrictly_Prohibited8State();
}

class _EditStrictly_Prohibited8State extends State<EditStrictly_Prohibited9> {
  int strictlyprohibited9 = -1;

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
          strictlyprohibited9 = patient.strictlyprohibited9;
        });
        break;
      }
    }
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited9 == index) {
        strictlyprohibited9 = -1;
      } else {
        strictlyprohibited9 = index;
      }
      widget.onChanged(strictlyprohibited9);
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
            'มีประวัติได้รับยาต้านการเเข็งตัวของเลือด \n  โดยมีค่า PT > 15 วินาที หรือมีค่า INR > 1.7',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: strictlyprohibited9 == 0,
                      activeColor: Color(0xFF304FFE),
                      onChanged: (value) {
                        _handleCheckboxChange(0);
                      },
                    ),
                    Text(
                      'มี',
                      style: TextStyle(fontSize: height * 0.018),
                    ),
                  ],
                ),
                SizedBox(width: width * 0.05),
                Row(
                  children: [
                    Checkbox(
                      value: strictlyprohibited9 == 1,
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
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
