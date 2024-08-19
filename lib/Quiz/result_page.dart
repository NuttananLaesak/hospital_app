import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int totalScore;
  final int selectedScore1;
  final String selectedText1;
  final int selectedScore2;
  final String selectedText2;
  final int selectedScore3;
  final String selectedText3;
  final int selectedScore4;
  final String selectedText4;
  final int selectedScore5;
  final String selectedText5;
  final int selectedScore6;
  final String selectedText6;
  final int selectedScore7;
  final String selectedText7;
  final int selectedScore8;
  final String selectedText8;
  final int selectedScore9;
  final String selectedText9;
  final int selectedScore10;
  final String selectedText10;
  final int selectedScore11;
  final String selectedText11;
  final int selectedScore12;
  final String selectedText12;
  final int selectedScore13;
  final String selectedText13;
  final int selectedScore14;
  final String selectedText14;
  final int selectedScore15;
  final String selectedText15;

  ResultPage({
    required this.totalScore,
    required this.selectedScore1,
    required this.selectedText1,
    required this.selectedScore2,
    required this.selectedText2,
    required this.selectedScore3,
    required this.selectedText3,
    required this.selectedScore4,
    required this.selectedText4,
    required this.selectedScore5,
    required this.selectedText5,
    required this.selectedScore6,
    required this.selectedText6,
    required this.selectedScore7,
    required this.selectedText7,
    required this.selectedScore8,
    required this.selectedText8,
    required this.selectedScore9,
    required this.selectedText9,
    required this.selectedScore10,
    required this.selectedText10,
    required this.selectedScore11,
    required this.selectedText11,
    required this.selectedScore12,
    required this.selectedText12,
    required this.selectedScore13,
    required this.selectedText13,
    required this.selectedScore14,
    required this.selectedText14,
    required this.selectedScore15,
    required this.selectedText15,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Score: $totalScore',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Answers:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '$selectedText1 (Score: $selectedScore1)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText2 (Score: $selectedScore2)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText3 (Score: $selectedScore3)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText4 (Score: $selectedScore4)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText5 (Score: $selectedScore5)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText6 (Score: $selectedScore6)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText7 (Score: $selectedScore7)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText7 (Score: $selectedScore7)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText8 (Score: $selectedScore8)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText9 (Score: $selectedScore10)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText11 (Score: $selectedScore11)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText12 (Score: $selectedScore12)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText13 (Score: $selectedScore13)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText14 (Score: $selectedScore14)',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$selectedText15 (Score: $selectedScore15)',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
