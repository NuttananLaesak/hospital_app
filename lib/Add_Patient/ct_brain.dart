import 'package:flutter/material.dart';

Widget ctBrainWidget({
  required BuildContext context,
  required int? ctBrainScore,
  required String? ctBrainText,
  required Function(int?, String?) onChanged,
}) {
  final items = [
    'Not Available',
    'Normal',
    'Hypodensity < 1/3 MCA',
    'Hypodensity > 1/3 MCA',
    'Intracerebral Hemorrhage',
    'อื่นๆ',
  ];

  final scores = [0, 1, 2, 3, 4, 5]; // Numerical scores corresponding to items
  final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;

  bool isOtherSelected = ctBrainScore == 5;

  return InputDecorator(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.005),
    ),
    child: Column(
      children: [
        isOtherSelected
            ? TextFormField(
                initialValue: ctBrainText,
                // autofocus: true,
                onChanged: (String newText) {
                  onChanged(5, newText);
                },
                decoration: InputDecoration(
                  hintText: 'กรุณาพิมพ์',
                ),
              )
            : DropdownButtonFormField<int>(
                value:
                    ctBrainScore, // Automatically selects the previously saved value
                hint: const Text('เลือก'),
                onChanged: (int? newIndex) {
                  if (newIndex != null) {
                    if (newIndex == 5) {
                      onChanged(5, ''); // Open the text field for input
                    } else {
                      onChanged(scores[newIndex], items[newIndex]);
                    }
                  }
                },
                items:
                    items.asMap().entries.map<DropdownMenuItem<int>>((entry) {
                  int index = entry.key;
                  String value = entry.value;
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(value),
                  );
                }).toList(),
              ),
        if (isOtherSelected)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                onChanged(null, null); // Reset to allow dropdown selection
              },
              child: Text(
                'เลือกตัวเลือกอื่น',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
      ],
    ),
  );
}
