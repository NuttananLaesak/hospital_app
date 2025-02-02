import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited3 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited3;

  const Strictly_Prohibited3(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited3})
      : super(key: key);

  @override
  State<Strictly_Prohibited3> createState() => _Strictly_Prohibited3State();
}

class _Strictly_Prohibited3State extends State<Strictly_Prohibited3> {
  late int strictlyprohibited3;

  @override
  void initState() {
    super.initState();
    strictlyprohibited3 = widget.initialStrictlyprohibited3;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited3 == index) {
        strictlyprohibited3 = -1;
      } else {
        strictlyprohibited3 = index;
      }
      widget.onChanged(strictlyprohibited3);
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
            'มีประวัติเคยมีเลือดออกในสมองมาก่อน',
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
                      value: strictlyprohibited3 == 0,
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
                      value: strictlyprohibited3 == 1,
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
