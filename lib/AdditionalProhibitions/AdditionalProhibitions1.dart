import 'package:flutter/material.dart';

class AdditionalProhibitions1 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialAdditionalprohibitions1;

  const AdditionalProhibitions1(
      {Key? key,
      required this.onChanged,
      required this.initialAdditionalprohibitions1})
      : super(key: key);

  @override
  State<AdditionalProhibitions1> createState() =>
      _AdditionalProhibitions1State();
}

class _AdditionalProhibitions1State extends State<AdditionalProhibitions1> {
  late int additionalprohibitions1;

  @override
  void initState() {
    super.initState();
    additionalprohibitions1 = widget.initialAdditionalprohibitions1;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (additionalprohibitions1 == index) {
        additionalprohibitions1 = -1;
      } else {
        additionalprohibitions1 = index;
      }
      widget.onChanged(additionalprohibitions1);
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
                'มีคะเเนน NIHSS มากกว่า 25 คะเเนน',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: additionalprohibitions1 == 0,
                    activeColor: Color(0xFF304FFE),
                    onChanged: (value) {
                      _handleCheckboxChange(0);
                    },
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: additionalprohibitions1 == 1,
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
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}
