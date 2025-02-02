import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited12 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited12;

  const Strictly_Prohibited12(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited12})
      : super(key: key);

  @override
  State<Strictly_Prohibited12> createState() => _Strictly_Prohibited12State();
}

class _Strictly_Prohibited12State extends State<Strictly_Prohibited12> {
  late int strictlyprohibited12;

  @override
  void initState() {
    super.initState();
    strictlyprohibited12 = widget.initialStrictlyprohibited12;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited12 == index) {
        strictlyprohibited12 = -1;
      } else {
        strictlyprohibited12 = index;
      }
      widget.onChanged(strictlyprohibited12);
    });
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
            'มีประวัติได้รับยาเเละผลตรวจดังนี้',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Divider(color: Colors.black, thickness: 2),
          Text(
            '- ได้รับยากลุ่ม Non vitamin K antagonist \n  oral anticoagullant ภายใน 48 ชั่วโมง\n'
            '- มีผลการตรวจการเเข็งตัวของเลือดผิดปกติ \n  (aPTT, INR, Plt, Count, ECT, TT, \n  รวมทั้ง factor Xa activity assays)',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: height * 0.018),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: strictlyprohibited12 == 0,
                      activeColor: Color(0xFF304FFE),
                      onChanged: (value) {
                        _handleCheckboxChange(0);
                      },
                    ),
                    Text(
                      'มี',
                      style: TextStyle(fontSize: height * 0.018),
                    ),
                  ],
                ),
                SizedBox(width: width * 0.05),
                Row(
                  children: [
                    Checkbox(
                      value: strictlyprohibited12 == 1,
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
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
