import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient5.dart';
import 'package:hospital_app/Indications/Indications1.dart';
import 'package:hospital_app/Indications/Indications2.dart';
import 'package:hospital_app/Indications/Indications3.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited1.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited10.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited11.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited2.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited3.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited4.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited5.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited6.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited7.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited8.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited9.dart';

class AddPatient4 extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController hospitalController;
  final TextEditingController ageController;
  final String gender;
  final TextEditingController weightController;
  final TextEditingController systolicBloodPressureController;
  final TextEditingController diastolicBloodPressureController;
  final TextEditingController sugarController;
  final TextEditingController dateTimeController1;
  final TextEditingController dateTimeController2;
  final TextEditingController dateTimeController3;
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

  const AddPatient4({
    Key? key,
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
  }) : super(key: key);

  @override
  State<AddPatient4> createState() => _AddPatient4State();
}

class _AddPatient4State extends State<AddPatient4> {
  late bool ageMore;
  late bool ageLess;
  int indications1 = -1;
  late bool hourLess;
  late bool hourMore;
  int indications2 = -1;
  int indications3 = -1;
  int strictlyprohibited1 = -1;
  int strictlyprohibited2 = -1;
  int strictlyprohibited3 = -1;
  int strictlyprohibited4 = -1;
  int strictlyprohibited5 = -1;
  int strictlyprohibited6 = -1;
  late bool bloodLess;
  late bool bloodMore;
  int strictlyprohibited7 = -1;
  int strictlyprohibited8 = -1;
  int strictlyprohibited9 = -1;
  late bool sugarLess;
  late bool sugarMore;
  int strictlyprohibited10 = -1;
  late bool ctLess;
  late bool ctMore;
  int strictlyprohibited11 = -1;

  @override
  void initState() {
    super.initState();
    double timeDifference1 =
        double.parse((widget.timeDifference1 ?? 0.0).toStringAsFixed(2));
    if (timeDifference1 == 0) {
      indications1 = -1;
      hourLess = false;
      hourMore = false;
    } else {
      hourLess = timeDifference1 <= 4.5;
      hourMore = timeDifference1 >= 4.6;
      indications1 = hourLess ? 1 : 0;
    }
    int age = int.tryParse(widget.ageController.text) ?? 0;
    if (age == 0) {
      indications2 = -1;
      ageLess = false;
      ageMore = false;
    } else {
      ageMore = age >= 18;
      ageLess = age < 18;
      indications2 = ageMore ? 1 : 0;
    }
    int sblood = int.tryParse(widget.systolicBloodPressureController.text) ?? 0;
    int dblood =
        int.tryParse(widget.diastolicBloodPressureController.text) ?? 0;
    if (sblood == 0 || dblood == 0) {
      strictlyprohibited7 = -1;
      bloodLess = false;
      bloodMore = false;
    } else {
      bloodLess = sblood <= 184 && dblood <= 109;
      bloodMore = sblood >= 185 || dblood >= 110;
      strictlyprohibited7 = bloodLess ? 1 : 0;
    }
    int sugar = int.tryParse(widget.sugarController.text) ?? 0;
    if (sugar == 0) {
      strictlyprohibited10 = -1;
      sugarLess = false;
      sugarMore = false;
    } else {
      sugarMore = sugar >= 51;
      sugarLess = sugar <= 50;
      strictlyprohibited10 = sugarMore ? 1 : 0;
    }
    int? ctb = widget.ctBrain;
    if (ctb == null) {
      strictlyprohibited11 = -1;
      ctLess = false;
      ctMore = false;
    } else {
      ctLess = ctb <= 2;
      ctMore = ctb == 3;
      strictlyprohibited11 = ctLess ? 1 : 0;
    }
  }

  void updateIndications1(bool? value, bool isHourLess) {
    setState(() {
      if (isHourLess) {
        hourLess = value ?? false;
        hourMore = !hourLess;
      } else {
        hourMore = value ?? false;
        hourLess = !hourMore;
      }
      indications1 = hourLess ? 1 : 0;
    });
  }

  void updateIndications2(bool? value, bool isAgeMore) {
    setState(() {
      if (isAgeMore) {
        ageMore = value ?? false;
        ageLess = !ageMore;
      } else {
        ageLess = value ?? false;
        ageMore = !ageLess;
      }
      indications2 = ageMore ? 1 : 0;
    });
  }

  void updateStrictlyProhibited7(bool? value, bool isBloodLess) {
    setState(() {
      if (isBloodLess) {
        bloodLess = value ?? false;
        bloodMore = !bloodLess;
      } else {
        bloodMore = value ?? false;
        bloodLess = !bloodMore;
      }
      strictlyprohibited7 = bloodLess ? 1 : 0;
    });
  }

  void updateStrictlyProhibited10(bool? value, bool isSugarMore) {
    setState(() {
      if (isSugarMore) {
        sugarMore = value ?? false;
        sugarLess = !sugarMore;
      } else {
        sugarLess = value ?? false;
        sugarMore = !sugarLess;
      }
      strictlyprohibited10 = sugarMore ? 1 : 0;
    });
  }

  void updateStrictlyProhibited11(bool? value, bool isCtMore) {
    setState(() {
      if (isCtMore) {
        ctLess = value ?? false;
        ctMore = !ctLess;
      } else {
        ctMore = value ?? false;
        ctLess = !ctMore;
      }
      strictlyprohibited11 = ctLess ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ข้อบ่งชี้/ข้อห้าม',
            style: TextStyle(
                fontSize: height * 0.026, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.03),
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 192, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'ข้อบ่งชี้',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.04),
                        Indications1(
                          hourLess: hourLess,
                          hourMore: hourMore,
                          hourLessChanged: (value) =>
                              updateIndications1(value, true),
                          hourMoreChanged: (value) =>
                              updateIndications1(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Indictions2(
                          ageMore: ageMore,
                          ageLess: ageLess,
                          ageMoreChanged: (value) =>
                              updateIndications2(value, true),
                          AgeLessChanged: (value) =>
                              updateIndications2(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Indictions3(
                          onChanged: (value) {
                            setState(() {
                              indications3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 192, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          "ข้อห้ามอย่างเด็ดขาด",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        Strictly_Prohibited1(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited1 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited2(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited3(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited4(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited4 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited5(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited5 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited6(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited6 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited7(
                          bloodLess: bloodLess,
                          bloodMore: bloodMore,
                          bloodLessChanged: (value) =>
                              updateStrictlyProhibited7(value, true),
                          bloodMoreChanged: (value) =>
                              updateStrictlyProhibited7(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited8(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited8 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited9(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited9 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited10(
                          sugarLess: sugarLess,
                          sugarMore: sugarMore,
                          sugarMoreChanged: (value) =>
                              updateStrictlyProhibited10(value, true),
                          sugarLessChanged: (value) =>
                              updateStrictlyProhibited10(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited11(
                          ctLess: ctLess,
                          ctMore: ctMore,
                          ctLessChanged: (value) =>
                              updateStrictlyProhibited11(value, true),
                          ctMoreChanged: (value) =>
                              updateStrictlyProhibited11(value, false),
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPatient5(
                          nameController: widget.nameController,
                          hospitalController: widget.hospitalController,
                          ageController: widget.ageController,
                          gender: widget.gender,
                          weightController: widget.weightController,
                          systolicBloodPressureController:
                              widget.systolicBloodPressureController,
                          diastolicBloodPressureController:
                              widget.diastolicBloodPressureController,
                          sugarController: widget.sugarController,
                          dateTimeController1: widget.dateTimeController1,
                          dateTimeController2: widget.dateTimeController2,
                          dateTimeController3: widget.dateTimeController3,
                          timeDifference1: widget.timeDifference1,
                          timeDifference2: widget.timeDifference2,
                          symptomHead: widget.symptomHead,
                          symptomEye: widget.symptomEye,
                          symptomFace: widget.symptomFace,
                          symptomArm: widget.symptomArm,
                          symptomSpeech: widget.symptomSpeech,
                          symptomVisual: widget.symptomVisual,
                          symptomAphasia: widget.symptomAphasia,
                          symptomNeglect: widget.symptomNeglect,
                          selectedDiseases: widget.selectedDiseases,
                          ctBrain: widget.ctBrain,
                          ctBrainText: widget.ctBrainText,
                          totalScore: widget.totalScore,
                          selectedScore1: widget.selectedScore1,
                          selectedText1: widget.selectedText1,
                          selectedScore2: widget.selectedScore2,
                          selectedText2: widget.selectedText2,
                          selectedScore3: widget.selectedScore3,
                          selectedText3: widget.selectedText3,
                          selectedScore4: widget.selectedScore4,
                          selectedText4: widget.selectedText4,
                          selectedScore5: widget.selectedScore5,
                          selectedText5: widget.selectedText5,
                          selectedScore6: widget.selectedScore6,
                          selectedText6: widget.selectedText6,
                          selectedScore7: widget.selectedScore7,
                          selectedText7: widget.selectedText7,
                          selectedScore8: widget.selectedScore8,
                          selectedText8: widget.selectedText8,
                          selectedScore9: widget.selectedScore9,
                          selectedText9: widget.selectedText9,
                          selectedScore10: widget.selectedScore10,
                          selectedText10: widget.selectedText10,
                          selectedScore11: widget.selectedScore11,
                          selectedText11: widget.selectedText11,
                          selectedScore12: widget.selectedScore12,
                          selectedText12: widget.selectedText12,
                          selectedScore13: widget.selectedScore13,
                          selectedText13: widget.selectedText13,
                          selectedScore14: widget.selectedScore14,
                          selectedText14: widget.selectedText14,
                          selectedScore15: widget.selectedScore15,
                          selectedText15: widget.selectedText15,
                          nihssLevel: widget.nihssLevel,
                          indications1: indications1,
                          indications2: indications2,
                          indications3: indications3,
                          strictlyprohibited1: strictlyprohibited1,
                          strictlyprohibited2: strictlyprohibited2,
                          strictlyprohibited3: strictlyprohibited3,
                          strictlyprohibited4: strictlyprohibited4,
                          strictlyprohibited5: strictlyprohibited5,
                          strictlyprohibited6: strictlyprohibited6,
                          strictlyprohibited7: strictlyprohibited7,
                          strictlyprohibited8: strictlyprohibited8,
                          strictlyprohibited9: strictlyprohibited9,
                          strictlyprohibited10: strictlyprohibited10,
                          strictlyprohibited11: strictlyprohibited11,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF82B1FF)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(150, 70)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'หน้าถัดไป',
                    style: TextStyle(
                      fontSize: height * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
