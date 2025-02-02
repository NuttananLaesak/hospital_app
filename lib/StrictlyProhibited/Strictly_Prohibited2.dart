import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited2 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited2;

  const Strictly_Prohibited2(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited2})
      : super(key: key);

  @override
  State<Strictly_Prohibited2> createState() => _Strictly_Prohibited2State();
}

class _Strictly_Prohibited2State extends State<Strictly_Prohibited2> {
  late int strictlyprohibited2;

  @override
  void initState() {
    super.initState();
    strictlyprohibited2 = widget.initialStrictlyprohibited2;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited2 == index) {
        strictlyprohibited2 = -1;
      } else {
        strictlyprohibited2 = index;
      }
      widget.onChanged(strictlyprohibited2);
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
            'มีประวัติสงสัยภาวะ\nเลือดออกชั้นใต้เยื่อหุ้มสมอง\n(Subarachnoid Hemorrhage)',
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
                      value: strictlyprohibited2 == 0,
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
                      value: strictlyprohibited2 == 1,
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
