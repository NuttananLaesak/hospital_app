import 'package:flutter/material.dart';

class StrictlyNotProhibited4 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const StrictlyNotProhibited4({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<StrictlyNotProhibited4> createState() => _StrictlyNotProhibited4State();
}

class _StrictlyNotProhibited4State extends State<StrictlyNotProhibited4> {
  int strictlynotprohibited4 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlynotprohibited4 == index) {
        strictlynotprohibited4 = -1;
      } else {
        strictlynotprohibited4 = index;
      }
      widget.onChanged(strictlynotprohibited4);
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
            'เคยมีประวัติการผ่าตัดใหญ่ \nหรือมีอุบัติเหตุรุนเเรงภายใน 14 วัน',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: strictlynotprohibited4 == 0,
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
                      value: strictlynotprohibited4 == 1,
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
