import 'package:flutter/material.dart';

class SymptomNegelct extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const SymptomNegelct({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SymptomNegelct> createState() => _SymptomNegelctState();
}

class _SymptomNegelctState extends State<SymptomNegelct> {
  int symptomNegelct = -1;

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
            'Neglect : ไม่สนใจร่างกายหนึ่งด้าน',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: symptomNegelct == 1,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomNegelct = value! ? 1 : -1;
                    widget.onChanged(symptomNegelct);
                  });
                },
              ),
              Text(
                'มี',
                style: TextStyle(fontSize: height * 0.018),
              ),
              SizedBox(width: width * 0.04),
              Checkbox(
                value: symptomNegelct == 0,
                activeColor: Color(0xFF304FFE),
                onChanged: (value) {
                  setState(() {
                    symptomNegelct = value! ? 0 : -1;
                    widget.onChanged(symptomNegelct);
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
