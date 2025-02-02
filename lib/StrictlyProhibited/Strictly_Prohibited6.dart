import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited6 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlyprohibited6;

  const Strictly_Prohibited6(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlyprohibited6})
      : super(key: key);

  @override
  State<Strictly_Prohibited6> createState() => _Strictly_Prohibited6State();
}

class _Strictly_Prohibited6State extends State<Strictly_Prohibited6> {
  late int strictlyprohibited6;

  @override
  void initState() {
    super.initState();
    strictlyprohibited6 = widget.initialStrictlyprohibited6;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited6 == index) {
        strictlyprohibited6 = -1;
      } else {
        strictlyprohibited6 = index;
      }
      widget.onChanged(strictlyprohibited6);
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
            'มีการได้รับการผ่าตัดกระโหลกศรีษะ \nหรือกระดูกสันหลังภายใน 3 เดือน',
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
                      value: strictlyprohibited6 == 0,
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
                      value: strictlyprohibited6 == 1,
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
