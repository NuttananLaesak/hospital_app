import 'package:flutter/material.dart';

class Strictly_Prohibited11 extends StatelessWidget {
  final bool ctLess;
  final bool ctMore;
  final Function(bool?) ctLessChanged;
  final Function(bool?) ctMoreChanged;

  const Strictly_Prohibited11({
    Key? key,
    required this.ctLess,
    required this.ctMore,
    required this.ctLessChanged,
    required this.ctMoreChanged,
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
                'CT brain พบมีสมองขาดเลือดมากกว่า\nขนาด 1/3 ชอง cerebral hemisphere',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: ctMore,
                    activeColor: Color(0xFF304FFE),
                    onChanged: ctMoreChanged,
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: ctLess,
                    activeColor: Color(0xFF304FFE),
                    onChanged: ctLessChanged,
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
