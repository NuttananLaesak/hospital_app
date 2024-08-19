import 'package:flutter/material.dart';

class StrictlyNotProhibited6 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const StrictlyNotProhibited6({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<StrictlyNotProhibited6> createState() => _StrictlyNotProhibited6State();
}

class _StrictlyNotProhibited6State extends State<StrictlyNotProhibited6> {
  int strictlynotprohibited6 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlynotprohibited6 == index) {
        strictlynotprohibited6 = -1;
      } else {
        strictlynotprohibited6 = index;
      }
      widget.onChanged(strictlynotprohibited6);
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
            'มีประวัติ Recent Myocardial Infracytion ภายใน 3 เดือน',
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
                      value: strictlynotprohibited6 == 0,
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
                      value: strictlynotprohibited6 == 1,
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
