import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited10 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited10;

  const Strictly_Prohibited10(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited10})
      : super(key: key);

  @override
  State<Strictly_Prohibited10> createState() => _Strictly_Prohibited10State();
}

class _Strictly_Prohibited10State extends State<Strictly_Prohibited10> {
  late int strictlyprohibited10;

  @override
  void initState() {
    super.initState();
    strictlyprohibited10 = widget.initialStrictlyprohibited10;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited10 == index) {
        strictlyprohibited10 = -1;
      } else {
        strictlyprohibited10 = index;
      }
      widget.onChanged(strictlyprohibited10);
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
                'มีระดับน้ำตาลในเลือดเท่ากับ\nหรือน้อยกว่า 50 mg/dl หรือไม่',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: strictlyprohibited10 == 0,
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
                    value: strictlyprohibited10 == 1,
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
