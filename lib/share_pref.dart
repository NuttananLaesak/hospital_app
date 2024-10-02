class Patient {
  final int id;
  final String nameController;
  final String hospitalController;
  final int? ageController;
  final String gender;
  final String weightController;
  final String systolicBloodPressureController;
  final String diastolicBloodPressureController;
  final String sugarController;
  final String dateTimeController1;
  final String dateTimeController2;
  final String dateTimeController3;
  final double? timeDifference1;
  final double? timeDifference2;
  final int symptomHead;
  final int symptomEye;
  final int symptomFace;
  final int symptomArm;
  final int symptomSpeech;
  final int symptomVisual;
  final int symptomAphasia;
  final int symptomNeglect;
  final String selectedDiseases;
  final int scoreDiseases;
  final int? ctBrain;
  final String? ctBrainText;
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
  final String nihssLevel;
  final int indications1;
  final int indications2;
  final int indications3;
  final int strictlyprohibited1;
  final int strictlyprohibited2;
  final int strictlyprohibited3;
  final int strictlyprohibited4;
  final int strictlyprohibited5;
  final int strictlyprohibited6;
  final int strictlyprohibited7;
  final int strictlyprohibited8;
  final int strictlyprohibited9;
  final int strictlyprohibited10;
  final int strictlyprohibited11;
  final int strictlyprohibited12;
  final int strictlyprohibited13;
  final int strictlyprohibited14;
  final int strictlynotprohibited1;
  final int strictlynotprohibited2;
  final int strictlynotprohibited3;
  final int strictlynotprohibited4;
  final int strictlynotprohibited5;
  final int strictlynotprohibited6;
  final int additionalprohibitions1;
  final int additionalprohibitions2;
  final int additionalprohibitions3;
  final int additionalprohibitions4;
  final double medic1;
  final double medic2;
  final double medic3;
  final String beforecure;
  final String aftercure;
  final String? recordedTime1;
  final String? recordedTime2;

  Patient(
      {required this.id,
      required this.nameController,
      required this.hospitalController,
      required this.ageController,
      required this.gender,
      required this.weightController,
      required this.systolicBloodPressureController,
      required this.diastolicBloodPressureController,
      required this.sugarController,
      required this.dateTimeController1,
      required this.dateTimeController2,
      required this.dateTimeController3,
      required this.timeDifference1,
      required this.timeDifference2,
      required this.symptomHead,
      required this.symptomEye,
      required this.symptomFace,
      required this.symptomArm,
      required this.symptomSpeech,
      required this.symptomVisual,
      required this.symptomAphasia,
      required this.symptomNeglect,
      required this.selectedDiseases,
      required this.scoreDiseases,
      required this.ctBrain,
      required this.ctBrainText,
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
      required this.nihssLevel,
      required this.indications1,
      required this.indications2,
      required this.indications3,
      required this.strictlyprohibited1,
      required this.strictlyprohibited2,
      required this.strictlyprohibited3,
      required this.strictlyprohibited4,
      required this.strictlyprohibited5,
      required this.strictlyprohibited6,
      required this.strictlyprohibited7,
      required this.strictlyprohibited8,
      required this.strictlyprohibited9,
      required this.strictlyprohibited10,
      required this.strictlyprohibited11,
      required this.strictlyprohibited12,
      required this.strictlyprohibited13,
      required this.strictlyprohibited14,
      required this.strictlynotprohibited1,
      required this.strictlynotprohibited2,
      required this.strictlynotprohibited3,
      required this.strictlynotprohibited4,
      required this.strictlynotprohibited5,
      required this.strictlynotprohibited6,
      required this.additionalprohibitions1,
      required this.additionalprohibitions2,
      required this.additionalprohibitions3,
      required this.additionalprohibitions4,
      required this.medic1,
      required this.medic2,
      required this.medic3,
      required this.beforecure,
      required this.aftercure,
      required this.recordedTime1,
      required this.recordedTime2});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameController': nameController,
      'hospitalController': hospitalController,
      'ageController': ageController,
      'gender': gender,
      'weightController': weightController,
      'systolicBloodPressureController': systolicBloodPressureController,
      'diastolicBloodPressureController': diastolicBloodPressureController,
      'sugarController': sugarController,
      'dateTimeController1': dateTimeController1,
      'dateTimeController2': dateTimeController2,
      'dateTimeController3': dateTimeController3,
      'timeDifference1': timeDifference1,
      'timeDifference2': timeDifference2,
      'symptomHead': symptomHead,
      'symptomEye': symptomEye,
      'symptomFace': symptomFace,
      'symptomArm': symptomArm,
      'symptomSpeech': symptomSpeech,
      'symptomVisual': symptomVisual,
      'symptomAphasia': symptomAphasia,
      'symptomNeglect': symptomNeglect,
      'selectedDiseases': selectedDiseases,
      'scoreDiseases': scoreDiseases,
      'ctBrain': ctBrain,
      'ctBrainText': ctBrainText,
      'totalScore': totalScore,
      'selectedScore1': selectedScore1,
      'selectedScore2': selectedScore2,
      'selectedScore3': selectedScore3,
      'selectedScore4': selectedScore4,
      'selectedScore5': selectedScore5,
      'selectedScore6': selectedScore6,
      'selectedScore7': selectedScore7,
      'selectedScore8': selectedScore8,
      'selectedScore9': selectedScore9,
      'selectedScore10': selectedScore10,
      'selectedScore11': selectedScore11,
      'selectedScore12': selectedScore12,
      'selectedScore13': selectedScore13,
      'selectedScore14': selectedScore14,
      'selectedScore15': selectedScore15,
      'selectedText1': selectedText1,
      'selectedText2': selectedText2,
      'selectedText3': selectedText3,
      'selectedText4': selectedText4,
      'selectedText5': selectedText5,
      'selectedText6': selectedText6,
      'selectedText7': selectedText7,
      'selectedText8': selectedText8,
      'selectedText9': selectedText9,
      'selectedText10': selectedText10,
      'selectedText11': selectedText11,
      'selectedText12': selectedText12,
      'selectedText13': selectedText13,
      'selectedText14': selectedText14,
      'selectedText15': selectedText15,
      'nihssLevel': nihssLevel,
      'indications1': indications1,
      'indications2': indications2,
      'indications3': indications3,
      'strictlyprohibited1': strictlyprohibited1,
      'strictlyprohibited2': strictlyprohibited2,
      'strictlyprohibited3': strictlyprohibited3,
      'strictlyprohibited4': strictlyprohibited4,
      'strictlyprohibited5': strictlyprohibited5,
      'strictlyprohibited6': strictlyprohibited6,
      'strictlyprohibited7': strictlyprohibited7,
      'strictlyprohibited8': strictlyprohibited8,
      'strictlyprohibited9': strictlyprohibited9,
      'strictlyprohibited10': strictlyprohibited10,
      'strictlyprohibited11': strictlyprohibited11,
      'strictlyprohibited12': strictlyprohibited12,
      'strictlyprohibited13': strictlyprohibited13,
      'strictlyprohibited14': strictlyprohibited14,
      'strictlynotprohibited1': strictlynotprohibited1,
      'strictlynotprohibited2': strictlynotprohibited2,
      'strictlynotprohibited3': strictlynotprohibited3,
      'strictlynotprohibited4': strictlynotprohibited4,
      'strictlynotprohibited5': strictlynotprohibited5,
      'strictlynotprohibited6': strictlynotprohibited6,
      'additionalprohibitions1': additionalprohibitions1,
      'additionalprohibitions2': additionalprohibitions2,
      'additionalprohibitions3': additionalprohibitions3,
      'additionalprohibitions4': additionalprohibitions4,
      'medic1': medic1,
      'medic2': medic2,
      'medic3': medic3,
      'beforecure': beforecure,
      'aftercure': aftercure,
      'recordedTime1': recordedTime1,
      'recordedTime2': recordedTime2,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      nameController: map['nameController'],
      hospitalController: map['hospitalController'],
      ageController: map['ageController'],
      gender: map['gender'],
      weightController: map['weightController'],
      systolicBloodPressureController: map['systolicBloodPressureController'],
      diastolicBloodPressureController: map['diastolicBloodPressureController'],
      sugarController: map['sugarController'],
      dateTimeController1: map['dateTimeController1'],
      dateTimeController2: map['dateTimeController2'],
      dateTimeController3: map['dateTimeController3'],
      timeDifference1: map['timeDifference1'],
      timeDifference2: map['timeDifference2'],
      symptomHead: map['symptomHead'],
      symptomEye: map['symptomEye'],
      symptomFace: map['symptomFace'],
      symptomArm: map['symptomArm'],
      symptomSpeech: map['symptomSpeech'],
      symptomVisual: map['symptomVisual'],
      symptomAphasia: map['symptomAphasia'],
      symptomNeglect: map['symptomNeglect'],
      selectedDiseases: map['selectedDiseases'],
      scoreDiseases: map['scoreDiseases'],
      ctBrain: map['ctBrain'],
      ctBrainText: map['ctBrainText'],
      totalScore: map['totalScore'],
      selectedScore1: map['selectedScore1'],
      selectedScore2: map['selectedScore2'],
      selectedScore3: map['selectedScore3'],
      selectedScore4: map['selectedScore4'],
      selectedScore5: map['selectedScore5'],
      selectedScore6: map['selectedScore6'],
      selectedScore7: map['selectedScore7'],
      selectedScore8: map['selectedScore8'],
      selectedScore9: map['selectedScore9'],
      selectedScore10: map['selectedScore10'],
      selectedScore11: map['selectedScore11'],
      selectedScore12: map['selectedScore12'],
      selectedScore13: map['selectedScore13'],
      selectedScore14: map['selectedScore14'],
      selectedScore15: map['selectedScore15'],
      selectedText1: map['selectedText1'],
      selectedText2: map['selectedText2'],
      selectedText3: map['selectedText3'],
      selectedText4: map['selectedText4'],
      selectedText5: map['selectedText5'],
      selectedText6: map['selectedText6'],
      selectedText7: map['selectedText7'],
      selectedText8: map['selectedText8'],
      selectedText9: map['selectedText9'],
      selectedText10: map['selectedText10'],
      selectedText11: map['selectedText11'],
      selectedText12: map['selectedText12'],
      selectedText13: map['selectedText13'],
      selectedText14: map['selectedText14'],
      selectedText15: map['selectedText15'],
      nihssLevel: map['nihssLevel'],
      indications1: map['indications1'],
      indications2: map['indications2'],
      indications3: map['indications3'],
      strictlyprohibited1: map['strictlyprohibited1'],
      strictlyprohibited2: map['strictlyprohibited2'],
      strictlyprohibited3: map['strictlyprohibited3'],
      strictlyprohibited4: map['strictlyprohibited4'],
      strictlyprohibited5: map['strictlyprohibited5'],
      strictlyprohibited6: map['strictlyprohibited6'],
      strictlyprohibited7: map['strictlyprohibited7'],
      strictlyprohibited8: map['strictlyprohibited8'],
      strictlyprohibited9: map['strictlyprohibited9'],
      strictlyprohibited10: map['strictlyprohibited10'],
      strictlyprohibited11: map['strictlyprohibited11'],
      strictlyprohibited12: map['strictlyprohibited12'],
      strictlyprohibited13: map['strictlyprohibited13'],
      strictlyprohibited14: map['strictlyprohibited14'],
      strictlynotprohibited1: map['strictlynotprohibited1'],
      strictlynotprohibited2: map['strictlynotprohibited2'],
      strictlynotprohibited3: map['strictlynotprohibited3'],
      strictlynotprohibited4: map['strictlynotprohibited4'],
      strictlynotprohibited5: map['strictlynotprohibited5'],
      strictlynotprohibited6: map['strictlynotprohibited6'],
      additionalprohibitions1: map['additionalprohibitions1'],
      additionalprohibitions2: map['additionalprohibitions2'],
      additionalprohibitions3: map['additionalprohibitions3'],
      additionalprohibitions4: map['additionalprohibitions4'],
      medic1: map['medic1'],
      medic2: map['medic2'],
      medic3: map['medic3'],
      beforecure: map['beforecure'],
      aftercure: map['aftercure'],
      recordedTime1: map['recordedTime1'],
      recordedTime2: map['recordedTime2'],
    );
  }
}
