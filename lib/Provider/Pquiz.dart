import 'package:flutter/material.dart';

class QuizModel with ChangeNotifier {
  // ตัวแปรสำหรับคำถามที่ 1
  int _selectedScore1 = 0;
  String _selectedText1 = "";

  // Getter สำหรับคำถามที่ 1
  int get selectedScore1 => _selectedScore1;
  String get selectedText1 => _selectedText1;

  // ฟังก์ชันอัปเดตค่า score และ text ของคำถามที่ 1
  void updateScore1(int score, String text) {
    _selectedScore1 = score;
    _selectedText1 = text;
    notifyListeners();
  }

  // ตัวแปรสำหรับคำถามที่ 2
  int _selectedScore2 = 0;
  String _selectedText2 = "";

  // Getter สำหรับคำถามที่ 2
  int get selectedScore2 => _selectedScore2;
  String get selectedText2 => _selectedText2;

  // ฟังก์ชันอัปเดตค่า score และ text ของคำถามที่ 2
  void updateScore2(int score, String text) {
    _selectedScore2 = score;
    _selectedText2 = text;
    notifyListeners();
  }
}
