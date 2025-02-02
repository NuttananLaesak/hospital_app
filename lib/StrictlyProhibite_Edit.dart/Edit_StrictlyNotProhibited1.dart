import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditStrictlyNotProhibited1 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int patientId;

  const EditStrictlyNotProhibited1(
      {Key? key, required this.onChanged, required this.patientId})
      : super(key: key);

  @override
  State<EditStrictlyNotProhibited1> createState() =>
      _EditStrictlyNotProhibited1State();
}

class _EditStrictlyNotProhibited1State
    extends State<EditStrictlyNotProhibited1> {
  int strictlynotprohibited1 = 1;

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
          strictlynotprohibited1 = patient.strictlynotprohibited1;
        });
        break;
      }
    }
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlynotprohibited1 == index) {
        strictlynotprohibited1 = -1;
      } else {
        strictlynotprohibited1 = index;
      }
      widget.onChanged(strictlynotprohibited1);
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
            'มีอาการทางประสาทดีขึ้นอย่างรวดเร็ว\nจนเกือบเป็นปกติหรือมีอาการอย่างเดียว\nไม่รุนเเรง เช่น เเขนขาอ่อนเเรงเล็กน้อย\nโดย NIHSS น้อยกว่า 4 คะเเนน',
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
                      value: strictlynotprohibited1 == 0,
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
                      value: strictlynotprohibited1 == 1,
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
