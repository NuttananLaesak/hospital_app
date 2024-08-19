import 'package:flutter/material.dart';

class SymptomVisual extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const SymptomVisual({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SymptomVisual> createState() => _SymptomVisualState();
}

class _SymptomVisualState extends State<SymptomVisual> {
  int symptomVisual = -1;

  void _handleCheckboxChange(int index) {
    setState(() {
      if (symptomVisual == index) {
        symptomVisual = -1;
      } else {
        symptomVisual = index;
      }
      widget.onChanged(symptomVisual);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: height * 0.02),
          Center(
            child: Text(
              'Visual : การมองเห็น',
              style: TextStyle(fontSize: height * 0.019),
              textAlign: TextAlign.center,
            ),
          ),
          buildCheckbox(0, 'ปกติ'),
          buildCheckbox(1, 'มองไม่เห็นครึ่งซีกซ้าย'),
          buildCheckbox(2, 'มองไม่เห็นครึ่งซีกขวา'),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }

  Widget buildCheckbox(int index, String title) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        _handleCheckboxChange(index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.025),
        child: Row(
          children: [
            Checkbox(
              value: symptomVisual == index,
              activeColor: Color(0xFF304FFE),
              onChanged: (value) {
                _handleCheckboxChange(index);
              },
            ),
            Text(
              title,
              style: TextStyle(fontSize: height * 0.018),
            ),
          ],
        ),
      ),
    );
  }
}
