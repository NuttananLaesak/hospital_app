import 'package:flutter/material.dart';

class AdditionalProhibitions3 extends StatelessWidget {
  final bool age2Less;
  final bool age2sMore;
  final Function(bool?) age2LessChanged;
  final Function(bool?) age2MoreChanged;

  const AdditionalProhibitions3({
    Key? key,
    required this.age2Less,
    required this.age2sMore,
    required this.age2LessChanged,
    required this.age2MoreChanged,
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
                'มีอายุมากกว่า 80 ปีหรือไม่',
                style: TextStyle(fontSize: height * 0.019),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: age2sMore,
                    activeColor: Color(0xFF304FFE),
                    onChanged: age2MoreChanged,
                  ),
                  Text(
                    'ใช่',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: age2Less,
                    activeColor: Color(0xFF304FFE),
                    onChanged: age2LessChanged,
                  ),
                  Text(
                    'ไม่',
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
