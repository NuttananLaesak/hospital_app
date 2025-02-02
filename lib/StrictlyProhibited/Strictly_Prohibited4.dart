import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited4 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited4;

  const Strictly_Prohibited4(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited4})
      : super(key: key);

  @override
  State<Strictly_Prohibited4> createState() => _Strictly_Prohibited4State();
}

class _Strictly_Prohibited4State extends State<Strictly_Prohibited4> {
  late int strictlyprohibited4;

  @override
  void initState() {
    super.initState();
    strictlyprohibited4 = widget.initialStrictlyprohibited4;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited4 == index) {
        strictlyprohibited4 = -1;
      } else {
        strictlyprohibited4 = index;
      }
      widget.onChanged(strictlyprohibited4);
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
            'มีเนื้องอกในสมอง \n(Intracranical neoplasm), Aneuysm, \nArteriovenous Malformation (AVM)',
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
                      value: strictlyprohibited4 == 0,
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
                      value: strictlyprohibited4 == 1,
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
