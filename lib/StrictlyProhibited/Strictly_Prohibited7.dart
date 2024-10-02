import 'package:flutter/material.dart';

class Strictly_Prohibited7 extends StatelessWidget {
  final bool bloodLess;
  final bool bloodMore;
  final Function(bool?) bloodMoreChanged;
  final Function(bool?) bloodLessChanged;

  const Strictly_Prohibited7({
    Key? key,
    required this.bloodLess,
    required this.bloodMore,
    required this.bloodLessChanged,
    required this.bloodMoreChanged,
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
                'มีความดันโลหิตช่วงก่อนให้รักษาสูง\n(SBP > 185 mm/Hg)\n(DBP > 110 mm/Hg)\nเเละไม่สามารถลดความดันโลหิต\nลงได้ก่อนให้ยาละลายลิ่มเลือด',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: bloodMore,
                    activeColor: Color(0xFF304FFE),
                    onChanged: bloodMoreChanged,
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: bloodLess,
                    activeColor: Color(0xFF304FFE),
                    onChanged: bloodLessChanged,
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
