import 'package:flutter/material.dart';

class SymptomFace extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue3; // เพิ่มค่าเริ่มต้น

  const SymptomFace(
      {Key? key, required this.onChanged, required this.initialValue3})
      : super(key: key);

  @override
  State<SymptomFace> createState() => _SymptomFaceState();
}

class _SymptomFaceState extends State<SymptomFace> {
  late int symptomFace;

  @override
  void initState() {
    super.initState();
    symptomFace = widget.initialValue3; // กำหนดค่าเริ่มต้น
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
