import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited9 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const Strictly_Prohibited9({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<Strictly_Prohibited9> createState() => _Strictly_Prohibited8State();
}

class _Strictly_Prohibited8State extends State<Strictly_Prohibited9> {
  int strictlyprohibited9 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited9 == index) {
        strictlyprohibited9 = -1;
      } else {
        strictlyprohibited9 = index;
      }
      widget.onChanged(strictlyprohibited9);
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
            'มีภาวะเลือดออกง่ายเช่น',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Divider(color: Colors.black, thickness: 2),
          Text(
            '- มีปริมาณเกล็ดเลือดน้อยกว่า 100,000\n  ต่อลูกบาศก์มิลลิเมตร\n'
            '- ได้รับยา heparin ภายใน 48 ชั่วโมง \n  มีค่า PPT ผิดปกติ\n'
            '- ได้รับยาต้านการเเข็งตัวของเลือดเเละ \n  มีค่า PT >= 15 วินาที หรือมีค่า INR >= 1.7\n'
            '- มีประวัติได้รับยา NOACs ภายใน 48 ชั่วโมง \n  หรือ LMWHs ภายใน 24 ชั่วโมง เเละมีผล\n  การตรวจการเเข็งตัวของเลือดผิดปกติ \n  (aPT, INRm, Count, ECT, TT, \n  หรือ factor activiti assays)',
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
                      value: strictlyprohibited9 == 0,
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
                      value: strictlyprohibited9 == 1,
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
