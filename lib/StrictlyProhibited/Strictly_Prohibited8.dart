import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited8 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const Strictly_Prohibited8({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<Strictly_Prohibited8> createState() => _Strictly_Prohibited8State();
}

class _Strictly_Prohibited8State extends State<Strictly_Prohibited8> {
  int strictlyprohibited8 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited8 == index) {
        strictlyprohibited8 = -1;
      } else {
        strictlyprohibited8 = index;
      }
      widget.onChanged(strictlyprohibited8);
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
            'มีผลการตรวจร่างกายพบว่ามีภาวะเลือดออก (Active Bleeding)',
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
                      value: strictlyprohibited8 == 0,
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
                      value: strictlyprohibited8 == 1,
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
