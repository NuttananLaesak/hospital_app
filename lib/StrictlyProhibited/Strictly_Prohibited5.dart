import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Strictly_Prohibited5 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const Strictly_Prohibited5({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<Strictly_Prohibited5> createState() => _Strictly_Prohibited5State();
}

class _Strictly_Prohibited5State extends State<Strictly_Prohibited5> {
  int strictlyprohibited5 = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlyprohibited5 == index) {
        strictlyprohibited5 = -1;
      } else {
        strictlyprohibited5 = index;
      }
      widget.onChanged(strictlyprohibited5);
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
            'มีการเเทงหลอกเลือดเเดงขนาดใหญ่\nในตำเเหน่งที่ไม่สามารถกดได้ภายใน7วัน',
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
                      value: strictlyprohibited5 == 0,
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
                      value: strictlyprohibited5 == 1,
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
