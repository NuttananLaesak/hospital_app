import 'package:flutter/material.dart';

class SymptomHead extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue1; // เพิ่มค่าเริ่มต้น

  const SymptomHead(
      {Key? key, required this.onChanged, required this.initialValue1})
      : super(key: key);

  @override
  State<SymptomHead> createState() => _SymptomHeadState();
}

class _SymptomHeadState extends State<SymptomHead> {
  late int symptomHead;

  @override
  void initState() {
    super.initState();
    symptomHead = widget.initialValue1; // กำหนดค่าเริ่มต้น
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
