import 'package:flutter/material.dart';

class Strictly_Prohibited7 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited7;

  const Strictly_Prohibited7(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited7})
      : super(key: key);

  @override
  State<Strictly_Prohibited7> createState() => _Strictly_Prohibited7State();
}

class _Strictly_Prohibited7State extends State<Strictly_Prohibited7> {
  late int strictlyprohibited7;

  @override
  void initState() {
    super.initState();
    strictlyprohibited7 = widget.initialStrictlyprohibited7;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited7 == index) {
        strictlyprohibited7 = -1;
      } else {
        strictlyprohibited7 = index;
      }
      widget.onChanged(strictlyprohibited7);
    });
  }

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
                    value: strictlyprohibited7 == 0,
                    activeColor: Color(0xFF304FFE),
                    onChanged: (value) {
                      _handleCheckboxChange(0);
                    },
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: strictlyprohibited7 == 1,
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
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}
