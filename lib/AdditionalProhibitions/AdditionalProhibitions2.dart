import 'package:flutter/material.dart';

class AdditionalProhibitions2 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialAdditionalprohibitions2;

  const AdditionalProhibitions2(
      {Key? key,
      required this.onChanged,
      required this.initialAdditionalprohibitions2})
      : super(key: key);

  @override
  State<AdditionalProhibitions2> createState() =>
      _AdditionalProhibitions2State();
}

class _AdditionalProhibitions2State extends State<AdditionalProhibitions2> {
  late int additionalprohibitions2;

  @override
  void initState() {
    super.initState();
    additionalprohibitions2 = widget.initialAdditionalprohibitions2;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (additionalprohibitions2 == index) {
        additionalprohibitions2 = -1;
      } else {
        additionalprohibitions2 = index;
      }
      widget.onChanged(additionalprohibitions2);
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
            'เคยเป็นโรคหลอดเลือดสมองตีบหรือ\nหลอดเลือดสมองอุดตันภายใน 3 เดือน',
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
                      value: additionalprohibitions2 == 0,
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
                      value: additionalprohibitions2 == 1,
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
