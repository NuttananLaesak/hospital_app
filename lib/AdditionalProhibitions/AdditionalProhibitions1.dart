import 'package:flutter/material.dart';

class AdditionalProhibitions1 extends StatelessWidget {
  final bool nihssLess;
  final bool nihssMore;
  final Function(bool?) nihssLessChanged;
  final Function(bool?) nihssMoreChanged;

  const AdditionalProhibitions1({
    Key? key,
    required this.nihssLess,
    required this.nihssMore,
    required this.nihssLessChanged,
    required this.nihssMoreChanged,
  }) : super(key: key);

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
                    value: nihssMore,
                    activeColor: Color(0xFF304FFE),
                    onChanged: nihssMoreChanged,
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: nihssLess,
                    activeColor: Color(0xFF304FFE),
                    onChanged: nihssLessChanged,
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
