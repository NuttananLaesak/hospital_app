import 'package:flutter/material.dart';

class Indictions2 extends StatelessWidget {
  final bool ageMore;
  final bool ageLess;
  final Function(bool?) ageMoreChanged;
  final Function(bool?) AgeLessChanged;

  const Indictions2({
    Key? key,
    required this.ageMore,
    required this.ageLess,
    required this.ageMoreChanged,
    required this.AgeLessChanged,
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
                'มีอายุเท่ากับหรือมากกว่า 18 ปีหรือไม่',
                style: TextStyle(fontSize: height * 0.019),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: ageMore,
                    activeColor: Color(0xFF304FFE),
                    onChanged: ageMoreChanged,
                  ),
                  Text(
                    'มี',
                    style: TextStyle(fontSize: height * 0.018),
                  ),
                  SizedBox(width: width * 0.05),
                  Checkbox(
                    value: ageLess,
                    activeColor: Color(0xFF304FFE),
                    onChanged: AgeLessChanged,
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
