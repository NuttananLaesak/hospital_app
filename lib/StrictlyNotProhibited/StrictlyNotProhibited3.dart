import 'package:flutter/material.dart';

class StrictlyNotProhibited3 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const StrictlyNotProhibited3({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<StrictlyNotProhibited3> createState() => _StrictlyNotProhibited3State();
}

class _StrictlyNotProhibited3State extends State<StrictlyNotProhibited3> {
  int strictlynotprohibited3 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlynotprohibited3 == index) {
        strictlynotprohibited3 = -1;
      } else {
        strictlynotprohibited3 = index;
      }
      widget.onChanged(strictlynotprohibited3);
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
            'มีอาการชักตอนเริ่มต้นเเละภายหลังจากชัก\nยังมีอาการอ่อนเเรงอยู่ เเละมีประวัติลมชัก',
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
                      value: strictlynotprohibited3 == 0,
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
                      value: strictlynotprohibited3 == 1,
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
