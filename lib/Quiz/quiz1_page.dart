import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_app/Provider/Pquiz.dart';
import 'package:hospital_app/Quiz/quiz2_page.dart';
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';

class Question1Page extends StatefulWidget {
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

  final String selectedDiseases;
  final int? ctBrain;
  final String? ctBrainText;

  const Question1Page({
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
    required this.selectedDiseases,
    required this.ctBrain,
    required this.ctBrainText,
  }) : super(key: key);

  @override
  _Question1PageState createState() => _Question1PageState();
}

class _Question1PageState extends State<Question1Page> {
  int selectedScore1 = 0;
  String selectedText1 = "";

  @override
  void initState() {
    super.initState();
    final quiz = Provider.of<QuizModel>(context, listen: false);
    selectedScore1 = quiz.selectedScore1;
  }

  void _selectAnswer(int score, String text) {
    final quiz = Provider.of<QuizModel>(context, listen: false);
    quiz.updateScore1(score, text);
    setState(() {
      selectedScore1 = score;
      selectedText1 = text;
    });

    _nextPage();
  }

  void _nextPage() {
    if (selectedText1.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Question2Page(
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
            selectedDiseases: widget.selectedDiseases,
            ctBrain: widget.ctBrain,
            ctBrainText: widget.ctBrainText,
            selectedScore1: selectedScore1,
            selectedText1: selectedText1,
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
            FullScreenImageViewer(imagePath: 'images/nihss.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final quiz = Provider.of<QuizModel>(context, listen: false);

    String questionText =
        "ข้อที่ 1a ระดับความรู้สึก\n(Level of Consciousness, LOC)${selectedScore1}${quiz.selectedScore1}";
    List<String> _questions = [
      "รู้สึกตัวดี",
      "ไม่รู้สึกตัว เเต่สามารถปลุกได้",
      "ไม่รู้สึกตัว ต้องกระตุ้นซ้ำหรือ\nทำให้เจ็บ",
      "ไม่รู้สึกตัว ตอบสนองเฉพาะรีเฟล็กซ์"
    ];
    List<int> _scores = [0, 1, 2, 3];

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
                              child: GestureDetector(
                                onTap: _showFullScreenImage,
                                child: Image.asset('images/nihss.png',
                                    width: screenWidth * 0.4,
                                    height: screenHeight * 0.21),
                              ),
                            ),
                            Text(
                              questionText,
                              style: TextStyle(
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _questions.length,
                              itemBuilder: (BuildContext context, int index) {
                                String text = _questions[index];
                                int score = _scores[index];
                                bool isSelected = selectedScore1 == score;
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

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;

  FullScreenImageViewer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ภาพประกอบ'),
        centerTitle: true,
      ),
      body: PhotoView(
        imageProvider: AssetImage(imagePath),
        backgroundDecoration: BoxDecoration(
          color: Colors.transparent, // พื้นหลังสีดำเพื่อให้ดูชัดเจน
        ),
      ),
    );
  }
}
