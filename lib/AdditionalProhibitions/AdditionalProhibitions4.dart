import 'package:flutter/material.dart';

class AdditionalProhibitions4 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const AdditionalProhibitions4({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<AdditionalProhibitions4> createState() =>
      _AdditionalProhibitions4State();
}

class _AdditionalProhibitions4State extends State<AdditionalProhibitions4> {
  int additionalprohibitions4 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (additionalprohibitions4 == index) {
        additionalprohibitions4 = -1;
      } else {
        additionalprohibitions4 = index;
      }
      widget.onChanged(additionalprohibitions4);
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
            'มีประวัติได้รับยาละลายลิ่มเลือด \n(Warfarin) โดยไม่พิจารณา INR',
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
                      value: additionalprohibitions4 == 0,
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
                      value: additionalprohibitions4 == 1,
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
