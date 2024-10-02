import 'package:flutter/material.dart';

class Paddpatient2 extends ChangeNotifier {
  int symptomHead = -1;
  int symptomEye = -1;
  int symptomFace = -1;
  int symptomArm = -1;
  int symptomSpeech = -1;
  int symptomVisual = -1;
  int symptomAphasia = -1;
  int symptomNeglect = -1;

  void setSymptomHead(int value) {
    symptomHead = value;
    notifyListeners();
  }

  void setSymptomEye(int value) {
    symptomEye = value;
    notifyListeners();
  }

  void setSymptomFace(int value) {
    symptomFace = value;
    notifyListeners();
  }

  void setSymptomArm(int value) {
    symptomArm = value;
    notifyListeners();
  }

  void setSymptomSpeech(int value) {
    symptomSpeech = value;
    notifyListeners();
  }

  void setSymptomVisual(int value) {
    symptomVisual = value;
    notifyListeners();
  }

  void setSymptomAphasia(int value) {
    symptomAphasia = value;
    notifyListeners();
  }

  void setSymptomNeglect(int value) {
    symptomNeglect = value;
    notifyListeners();
  }
}
