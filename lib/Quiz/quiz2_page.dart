import 'package:flutter/material.dart';
import 'package:hospital_app/Quiz/quiz3_page.dart';

class Question2Page extends StatefulWidget {
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
  final int selectedScore1;
  final String selectedText1;

  Question2Page(
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
      required this.selectedScore1,
      required this.selectedText1});

  @override
  _Question2PageState createState() => _Question2PageState();
}

class _Question2PageState extends State<Question2Page> {
  int selectedScore2 = 0;
  String selectedText2 = "";

  void _selectAnswer(int score, String text) {
    setState(() {
      selectedScore2 = score;
      selectedText2 = text;
    });
    _nextPage();
  }

  void _nextPage() {
    if (selectedText2.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Question3Page(
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
            symptomNegelct: widget.symptomNegelct,
            selectedDiseases: widget.selectedDiseases,
            ctBrain: widget.ctBrain,
            ctBrainText: widget.ctBrainText,
            totalScore: widget.selectedScore1 + selectedScore2,
            selectedScore1: widget.selectedScore1,
            selectedText1: widget.selectedText1,
            selectedScore2: selectedScore2,
            selectedText2: selectedText2,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    String questionText = "ข้อที่ 1b สามารถบอกเดือนและอายุได้\n(LOC Questions)";
    List<String> _questions = [
      "ตอบได้ทั้ง 2 ข้อ",
      "ตอบถูกต้องเพียง 1 ข้อ",
      "ไม่สามารถตอบได้หรือตอบผิด\nทั้ง 2 ข้อ"
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
                                      color: selectedText2.isEmpty
                                          ? const Color(0xFFC5CAE9)
                                          : selectedText2 == text
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
