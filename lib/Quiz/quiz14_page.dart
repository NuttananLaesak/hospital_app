import 'package:flutter/material.dart';
import 'package:hospital_app/Image_Viwer.dart';
import 'package:hospital_app/Provider/Pquiz.dart';
import 'package:hospital_app/Quiz/quiz15_page.dart';
import 'package:provider/provider.dart';

class Question14Page extends StatefulWidget {
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
  final int totalScore;

  Question14Page({
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
    required this.totalScore,
  });

  @override
  State<Question14Page> createState() => _Question14PageState();
}

class _Question14PageState extends State<Question14Page> {
  int selectedScore14 = -1;
  String selectedText14 = "";

  @override
  void initState() {
    super.initState();
    final quiz = Provider.of<QuizModel>(context, listen: false);
    selectedScore14 = quiz.selectedScore14;
  }

  void _selectAnswer(int score, String text) {
    final quiz = Provider.of<QuizModel>(context, listen: false);
    quiz.updateScore14(score, text);
    setState(() {
      selectedScore14 = score;
      selectedText14 = text;
    });

    _nextPage();
  }

  void _nextPage() {
    if (selectedText14.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Question15Page(
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
            totalScore: widget.totalScore + selectedScore14,
          ),
        ),
      );
    }
  }

  void _showFullScreenImage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FullScreenImageViewer(imagePath: 'images/nihss10.jpg'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    String questionText = "ข้อที่ 10 การออกเสียง (Dysarthia)";
    List<String> _questions = [
      "พูดชัดเจนปกติ",
      "พูดไม่ชัดเล็กน้อยถึงปานกลาง",
      "พูดไม่ชัดอย่างมากหรือผู้ป่วยไม่พูด",
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
                      vertical: screenHeight * 0.03,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenHeight * 0.0),
                              child: GestureDetector(
                                onTap: _showFullScreenImage,
                                child: Image.asset('images/nihss10.jpg',
                                    width: screenWidth * 0.4,
                                    height: screenHeight * 0.21),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Text(
                              questionText,
                              style: TextStyle(
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _questions.length,
                              itemBuilder: (BuildContext context, int index) {
                                String text = _questions[index];
                                int score = _scores[index];
                                bool isSelected = selectedScore14 == score;
                                return GestureDetector(
                                  onTap: () => _selectAnswer(score, text),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(
                                              0xFF81C784) // สีเขียวเมื่อเลือกแล้ว
                                          : const Color(
                                              0xFFC5CAE9), // สีเริ่มต้นเมื่อยังไม่เลือก
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
