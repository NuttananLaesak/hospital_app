import 'package:flutter/material.dart';

class Strictly_Prohibited10 extends StatelessWidget {
  final bool sugarLess;
  final bool sugarMore;
  final Function(bool?) sugarLessChanged;
  final Function(bool?) sugarMoreChanged;

  const Strictly_Prohibited10({
    Key? key,
    required this.sugarLess,
    required this.sugarMore,
    required this.sugarLessChanged,
    required this.sugarMoreChanged,
  }) : super(key: key);

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
                'มีระดับน้ำตาลในเลือดเท่ากับ\nหรือน้อยกว่า 50 mg/dl หรือไม่',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: sugarLess,
                    activeColor: Color(0xFF304FFE),
                    onChanged: sugarLessChanged,
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: sugarMore,
                    activeColor: Color(0xFF304FFE),
                    onChanged: sugarMoreChanged,
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
