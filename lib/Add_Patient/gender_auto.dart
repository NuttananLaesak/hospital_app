import 'package:flutter/material.dart';

class GenderAuto extends StatefulWidget {
  final Function(String) onGenderSelected; // Callback to update parent state
  final String initialGender; // รับค่าเพศเริ่มต้น

  GenderAuto({required this.onGenderSelected, required this.initialGender});

  @override
  State<GenderAuto> createState() => _GenderAutoState();
}

class _GenderAutoState extends State<GenderAuto> {
  String selectedGender = '';

  void _handleGenderSelection(String gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onGenderSelected(selectedGender);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ปุ่มเพศชาย
        GestureDetector(
          onTap: () => _handleGenderSelection('ชาย'),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.13, vertical: height * 0.01),
            decoration: BoxDecoration(
              color: widget.initialGender == 'ชาย' ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20)), // มุมซ้ายมน
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'ชาย',
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.022,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // ปุ่มเพศหญิง
        GestureDetector(
          onTap: () => _handleGenderSelection('หญิง'),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.13, vertical: height * 0.01),
            decoration: BoxDecoration(
              color: widget.initialGender == 'หญิง' ? Colors.pink : Colors.grey,
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20)), // มุมขวามน
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'หญิง',
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.022,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
