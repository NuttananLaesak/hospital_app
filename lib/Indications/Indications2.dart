import 'package:flutter/material.dart';

class Indictions2 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialIndications2;

  const Indictions2(
      {Key? key, required this.onChanged, required this.initialIndications2})
      : super(key: key);

  @override
  State<Indictions2> createState() => _Indictions2State();
}

class _Indictions2State extends State<Indictions2> {
  late int indications2;

  @override
  void initState() {
    super.initState();
    indications2 = widget.initialIndications2;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (indications2 == index) {
        indications2 = -1;
      } else {
        indications2 = index;
      }
      widget.onChanged(indications2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              Text(
                'มีอายุเท่ากับหรือมากกว่า 18 ปีหรือไม่',
                style: TextStyle(fontSize: height * 0.019),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: indications2 == 1,
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
                    value: indications2 == 0,
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
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}
