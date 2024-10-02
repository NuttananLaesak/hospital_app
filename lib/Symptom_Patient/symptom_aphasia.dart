import 'package:flutter/material.dart';

class SymptomAphasia extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue7; // เพิ่มค่าเริ่มต้น

  const SymptomAphasia(
      {Key? key, required this.onChanged, required this.initialValue7})
      : super(key: key);

  @override
  State<SymptomAphasia> createState() => _SymptomAphasiaState();
}

class _SymptomAphasiaState extends State<SymptomAphasia> {
  late int symptomAphasia;

  @override
  void initState() {
    super.initState();
    symptomAphasia = widget.initialValue7; // กำหนดค่าเริ่มต้น
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
