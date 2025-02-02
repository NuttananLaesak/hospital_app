import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Indictions3 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialIndications3;

  const Indictions3(
      {Key? key, required this.onChanged, required this.initialIndications3})
      : super(key: key);

  @override
  State<Indictions3> createState() => _Indictions3State();
}

class _Indictions3State extends State<Indictions3> {
  late int indications3;

  @override
  void initState() {
    super.initState();
    indications3 = widget.initialIndications3;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (indications3 == index) {
        indications3 = -1;
      } else {
        indications3 = index;
      }
      widget.onChanged(indications3);
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
            'ผล CT brain ไม่พบว่ามีเลือดออก\nในเนื้อสมองหรือชั้นใต้เยื่อหุ้มสมองหรือไม่',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: indications3 == 1,
                      activeColor: Color(0xFF304FFE),
                      onChanged: (value) {
                        _handleCheckboxChange(1);
                      },
                    ),
                    Text(
                      'มี',
                      style: TextStyle(fontSize: height * 0.018),
                    ),
                    SizedBox(width: width * 0.05),
                    Checkbox(
                      value: indications3 == 0,
                      activeColor: Color(0xFF304FFE),
                      onChanged: (value) {
                        _handleCheckboxChange(0);
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
