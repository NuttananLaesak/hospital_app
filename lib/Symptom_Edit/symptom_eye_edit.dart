import 'package:flutter/material.dart';

class SymptomEyeEdit extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const SymptomEyeEdit({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SymptomEyeEdit> createState() => _SymptomEyeEditState();
}

class _SymptomEyeEditState extends State<SymptomEyeEdit> {
  int symptomEye = -1;

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
            'Eye : ตาดับทันทีทันใด\nมองเห็นภาพซ้อนเฉียบพลัน',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: symptomEye == 1,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomEye = value! ? 1 : -1;
                    widget.onChanged(symptomEye);
                  });
                },
              ),
              Text(
                'มี',
                style: TextStyle(fontSize: height * 0.018),
              ),
              SizedBox(width: width * 0.04),
              Checkbox(
                value: symptomEye == 0,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomEye = value! ? 0 : -1;
                    widget.onChanged(symptomEye);
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
