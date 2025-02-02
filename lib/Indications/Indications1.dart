import 'package:flutter/material.dart';

class Indications1 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialIndications1;

  const Indications1(
      {Key? key, required this.onChanged, required this.initialIndications1})
      : super(key: key);

  @override
  State<Indications1> createState() => _Indications1State();
}

class _Indications1State extends State<Indications1> {
  late int indications1;

  @override
  void initState() {
    super.initState();
    indications1 = widget.initialIndications1;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (indications1 == index) {
        indications1 = -1;
      } else {
        indications1 = index;
      }
      widget.onChanged(indications1);
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
                'มีอาการของหลอดเลือดสมองตีบ\nภายในระยะเวลา 4.5 ชั่วโมงหรือไม่',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: indications1 == 1,
                    activeColor: Color(0xFF304FFE),
                    onChanged: (value) {
                      _handleCheckboxChange(1);
                    },
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: indications1 == 0,
                    activeColor: Color(0xFF304FFE),
                    onChanged: (value) {
                      _handleCheckboxChange(0);
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
