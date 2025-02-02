import 'package:flutter/material.dart';

class Strictly_Prohibited11 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited11;

  const Strictly_Prohibited11(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited11})
      : super(key: key);

  @override
  State<Strictly_Prohibited11> createState() => _Strictly_Prohibited11State();
}

class _Strictly_Prohibited11State extends State<Strictly_Prohibited11> {
  late int strictlyprohibited11;

  @override
  void initState() {
    super.initState();
    strictlyprohibited11 = widget.initialStrictlyprohibited11;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited11 == index) {
        strictlyprohibited11 = -1;
      } else {
        strictlyprohibited11 = index;
      }
      widget.onChanged(strictlyprohibited11);
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
                'CT brain พบมีสมองขาดเลือดมากกว่า\nขนาด 1/3 ชอง cerebral hemisphere',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: strictlyprohibited11 == 0,
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
                    value: strictlyprohibited11 == 1,
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
