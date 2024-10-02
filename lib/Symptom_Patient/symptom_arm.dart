import 'package:flutter/material.dart';

class SymptomArm extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue4; // เพิ่มค่าเริ่มต้น

  const SymptomArm(
      {Key? key, required this.onChanged, required this.initialValue4})
      : super(key: key);

  @override
  State<SymptomArm> createState() => _SymptomArmState();
}

class _SymptomArmState extends State<SymptomArm> {
  late int symptomArm;

  @override
  void initState() {
    super.initState();
    symptomArm = widget.initialValue4; // กำหนดค่าเริ่มต้น
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (symptomArm == index) {
        symptomArm = -1;
      } else {
        symptomArm = index;
      }
      widget.onChanged(symptomArm);
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
            'Arm : เเขน/ขาอ่อนเเรงเฉียบพลัน',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: symptomArm == 0,
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
                value: symptomArm == 1,
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
                value: symptomArm == 2,
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
