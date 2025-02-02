import 'package:flutter/material.dart';

class Paddpatient5 extends ChangeNotifier {
  int strictlynotprohibited1 = -1;
  int strictlynotprohibited2 = -1;
  int strictlynotprohibited3 = -1;
  int strictlynotprohibited4 = -1;
  int strictlynotprohibited5 = -1;
  int strictlynotprohibited6 = -1;
  int additionalprohibitions1 = -1;
  int additionalprohibitions2 = -1;
  int additionalprohibitions3 = -1;
  int additionalprohibitions4 = -1;

  void setStrictlynotprohibited1(int value) {
    strictlynotprohibited1 = value;
    notifyListeners();
  }

  void setStrictlynotprohibited2(int value) {
    strictlynotprohibited2 = value;
    notifyListeners();
  }

  void setStrictlynotprohibited3(int value) {
    strictlynotprohibited3 = value;
    notifyListeners();
  }

  void setStrictlynotprohibited4(int value) {
    strictlynotprohibited4 = value;
    notifyListeners();
  }

  void setStrictlynotprohibited5(int value) {
    strictlynotprohibited5 = value;
    notifyListeners();
  }

  void setStrictlynotprohibited6(int value) {
    strictlynotprohibited6 = value;
    notifyListeners();
  }

  void setAdditionalprohibitions1(int value) {
    additionalprohibitions1 = value;
    notifyListeners();
  }

  void setAdditionalprohibitions2(int value) {
    additionalprohibitions2 = value;
    notifyListeners();
  }

  void setAdditionalprohibitions3(int value) {
    additionalprohibitions3 = value;
    notifyListeners();
  }

  void setAdditionalprohibitions4(int value) {
    additionalprohibitions4 = value;
    notifyListeners();
  }

  void resetAdditionalprohibitions() {
    strictlynotprohibited1 = -1;
    strictlynotprohibited2 = -1;
    strictlynotprohibited3 = -1;
    strictlynotprohibited4 = -1;
    strictlynotprohibited5 = -1;
    strictlynotprohibited6 = -1;
    additionalprohibitions1 = -1;
    additionalprohibitions2 = -1;
    additionalprohibitions3 = -1;
    additionalprohibitions4 = -1;
    notifyListeners();
  }
}
