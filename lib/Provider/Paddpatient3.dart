import 'package:flutter/material.dart';

class Paddpatient3 extends ChangeNotifier {
  int? _ctBrainScore;
  String? _ctBrainText;
  String _selectedDiseases = '';
  int _onDiseasesScore = -1;

  int? get ctBrainScore => _ctBrainScore;
  String? get ctBrainText => _ctBrainText;
  String get selectedDiseases => _selectedDiseases;
  int get onDiseasesScore => _onDiseasesScore;

  void updateCtBrainScore(int? score, String? text) {
    _ctBrainScore = score;
    _ctBrainText = text;
    notifyListeners();
  }

  void updateSelectedDiseases(String newDiseases) {
    _selectedDiseases = newDiseases;
    notifyListeners();
  }

  void updateOnDiseasesScore(int newScore) {
    _onDiseasesScore = newScore;
    notifyListeners();
  }
}
