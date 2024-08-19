import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final Function(String) onGenderSelected; // Callback to update parent state

  const GenderSelection({Key? key, required this.onGenderSelected})
      : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String selectedGender = '';

  void _handleGenderSelection(int index) {
    setState(() {
      selectedGender = index == 0 ? 'ชาย' : 'หญิง';
    });
    widget.onGenderSelected(selectedGender);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: height * 0.01,
          bottom: height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Text(
                  'เพศ',
                  style: TextStyle(
                      fontSize: height * 0.023, fontWeight: FontWeight.bold),
                ),
              ),
              ToggleButtons(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.male),
                      const Text('ชาย'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female),
                      const Text('หญิง'),
                    ],
                  ),
                ],
                onPressed: _handleGenderSelection,
                isSelected: [selectedGender == 'ชาย', selectedGender == 'หญิง'],
                fillColor: Color(0xFF304FFE),
                selectedColor: Colors.white,
                selectedBorderColor: Colors.black,
                borderColor: Colors.black,
                color: Colors.black,
                borderWidth: 1,
                borderRadius: BorderRadius.circular(10),
                constraints: BoxConstraints.expand(
                    width: width * 0.395, height: height * 0.05),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
