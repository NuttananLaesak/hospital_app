import 'package:flutter/material.dart';

class StrictlyNotProhibited5 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlynotprohibited5;

  const StrictlyNotProhibited5(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlynotprohibited5})
      : super(key: key);

  @override
  State<StrictlyNotProhibited5> createState() => _StrictlyNotProhibited5State();
}

class _StrictlyNotProhibited5State extends State<StrictlyNotProhibited5> {
  late int strictlynotprohibited5;

  @override
  void initState() {
    super.initState();
    strictlynotprohibited5 = widget.initialStrictlynotprohibited5;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlynotprohibited5 == index) {
        strictlynotprohibited5 = -1;
      } else {
        strictlynotprohibited5 = index;
      }
      widget.onChanged(strictlynotprohibited5);
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
            'มีเลือดออกในทางเดินอาหาร \nหรือทางเดินปัสสาวะภายใน 21 วัน',
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
                      value: strictlynotprohibited5 == 0,
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
                      value: strictlynotprohibited5 == 1,
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
