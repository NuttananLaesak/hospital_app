import 'package:flutter/material.dart';

class Indications1 extends StatelessWidget {
  final bool hourLess;
  final bool hourMore;
  final Function(bool?) hourLessChanged;
  final Function(bool?) hourMoreChanged;

  const Indications1({
    Key? key,
    required this.hourLess,
    required this.hourMore,
    required this.hourLessChanged,
    required this.hourMoreChanged,
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
                'มีอาการของหลอดเลือดสมองตีบ\nภายในระยะเวลา 4.5 ชั่วโมงหรือไม่',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: hourLess,
                    activeColor: Color(0xFF304FFE),
                    onChanged: hourLessChanged,
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: hourMore,
                    activeColor: Color(0xFF304FFE),
                    onChanged: hourMoreChanged,
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
