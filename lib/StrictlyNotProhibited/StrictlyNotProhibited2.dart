import 'package:flutter/material.dart';

class StrictlyNotProhibited2 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const StrictlyNotProhibited2({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<StrictlyNotProhibited2> createState() => _StrictlyNotProhibited2State();
}

class _StrictlyNotProhibited2State extends State<StrictlyNotProhibited2> {
  int strictlynotprohibited2 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlynotprohibited2 == index) {
        strictlynotprohibited2 = -1;
      } else {
        strictlynotprohibited2 = index;
      }
      widget.onChanged(strictlynotprohibited2);
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
            'มีการตั้งครรภ์',
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
                      value: strictlynotprohibited2 == 0,
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
                      value: strictlynotprohibited2 == 1,
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
