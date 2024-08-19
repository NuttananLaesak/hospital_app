import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient4.dart';

class Question15Page extends StatefulWidget {
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
  final int symptomNegelct;
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

  Question15Page(
      {required this.nameController,
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
      required this.symptomNegelct,
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
      required this.selectedText14});

  @override
  State<Question15Page> createState() => _Question15PageState();
}

class _Question15PageState extends State<Question15Page> {
  int selectedScore15 = 0;
  String selectedText15 = "";
  late String nihssLevel;

  void _selectAnswer(int score, String text) {
    setState(() {
      selectedScore15 = score;
      selectedText15 = text;
    });
    _nextPage();
  }

  void updateNIHSSLevel(int totalScore) {
    if (totalScore == 0) {
      nihssLevel = "No Stroke";
    } else if (totalScore >= 1 && totalScore <= 4) {
      nihssLevel = "Minor Stroke";
    } else if (totalScore >= 5 && totalScore <= 15) {
      nihssLevel = "Moderate Stroke";
    } else if (totalScore >= 16 && totalScore <= 20) {
      nihssLevel = "Moderate to Severe Stroke";
    } else {
      nihssLevel = "Severe Stroke";
    }
  }

  void _nextPage() {
    if (selectedText15.isNotEmpty) {
      if (selectedText15.isNotEmpty) {
        updateNIHSSLevel(widget.totalScore + selectedScore15);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPatient4(
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
              symptomNeglect: widget.symptomNegelct,
              selectedDiseases: widget.selectedDiseases,
              ctBrain: widget.ctBrain,
              ctBrainText: widget.ctBrainText,
              totalScore: widget.totalScore + selectedScore15,
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
              selectedScore15: selectedScore15,
              selectedText15: selectedText15,
              nihssLevel: nihssLevel,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    String questionText =
        "ข้อที่ 11 การขาดความสนใจ\nในด้านใดด้านหนึ่งของร่างกาย\n(Extinetion and Inattention)";
    List<String> _questions = [
      "ไม่พบความความผิดปกติ",
      "มีความผิดปกติ\nในด้านการรับรู้อย่างน้อย 1 อย่าง",
      "มีความผิดปกติ\nในด้านการรับรู้มากกว่า 1 อย่าง",
    ];
    List<int> _scores = [0, 1, 2];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ประเมินระดับความรุนเเรง NIHSS',
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
      backgroundColor: const Color(0xFF90CAF9),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                height: screenHeight * 0.9,
                width: screenWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                ),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: const BorderSide(
                      color: Color(0xFF82B1FF),
                      width: 5,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenHeight * 0.0),
                              child: Image.asset('images/nihss.png',
                                  width: screenWidth * 0.4,
                                  height: screenHeight * 0.21),
                            ),
                            Text(
                              questionText,
                              style: TextStyle(
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.05),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _questions.length,
                              itemBuilder: (BuildContext context, int index) {
                                String text = _questions[index];
                                int score = _scores[index];
                                return GestureDetector(
                                  onTap: () => _selectAnswer(score, text),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: selectedText15.isEmpty
                                          ? const Color(0xFFC5CAE9)
                                          : selectedText15 == text
                                              ? const Color(0xFF81C784)
                                              : const Color(0xFFC5CAE9),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding:
                                        EdgeInsets.all(screenHeight * 0.02),
                                    margin: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.02,
                                        horizontal: screenWidth * 0.04),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '   $score     ',
                                          style: TextStyle(
                                            fontSize: screenHeight * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              fontSize: screenHeight * 0.02,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
