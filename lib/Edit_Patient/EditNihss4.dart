import 'dart:convert';
import 'package:hospital_app/Image_Viwer.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditNihss4 extends StatefulWidget {
  final int patientId;

  const EditNihss4({Key? key, required this.patientId}) : super(key: key);

  @override
  State<EditNihss4> createState() => _EditNihss4State();
}

class _EditNihss4State extends State<EditNihss4> {
  int _selectedScore = 0;
  String _selectedText = "";
  int _oldselectedScore = 0;
  int _totalScore = 0;
  late String nihssLevel;

  void _selectAnswer(int score, String text) {
    setState(() {
      _selectedScore = score;
      _selectedText = text;
    });
  }

  Patient? _patient;

  @override
  void initState() {
    super.initState();
    loadPatientData();
  }

  Future<void> loadPatientData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    for (var patientData in patientList) {
      Map<String, dynamic> map = Map.from(json.decode(patientData));
      Patient patient = Patient.fromMap(map);
      if (patient.id == widget.patientId) {
        setState(() {
          _patient = patient;
          _oldselectedScore = patient.selectedScore4;
          _totalScore = patient.totalScore;
        });
        break;
      }
    }
  }

  Future<void> _updatePatientData(int score, String text) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    setState(() {
      _selectedScore = score;
      _selectedText = text;
      _totalScore = _totalScore - _oldselectedScore + _selectedScore;
      if (_totalScore == 0) {
        nihssLevel = "No Stroke";
      } else if (_totalScore >= 1 && _totalScore <= 4) {
        nihssLevel = "Minor Stroke";
      } else if (_totalScore >= 5 && _totalScore <= 15) {
        nihssLevel = "Moderate Stroke";
      } else if (_totalScore >= 16 && _totalScore <= 20) {
        nihssLevel = "Moderate to Severe Stroke";
      } else {
        nihssLevel = "Severe Stroke";
      }
    });

    // อัปเดตข้อมูลผู้ป่วย
    final updatedPatient = Patient(
      id: widget.patientId,
      nameController: _patient?.nameController ?? '',
      hospitalController: _patient?.hospitalController ?? '',
      ageController: _patient?.ageController,
      gender: _patient?.gender ?? '',
      weightController: _patient?.weightController ?? '',
      systolicBloodPressureController:
          _patient?.systolicBloodPressureController ?? '',
      diastolicBloodPressureController:
          _patient?.diastolicBloodPressureController ?? '',
      sugarController: _patient?.sugarController ?? '',
      dateTimeController1: _patient?.dateTimeController1 ?? '',
      dateTimeController2: _patient?.dateTimeController2 ?? '',
      dateTimeController3: _patient?.dateTimeController3 ?? '',
      timeDifference1: _patient?.timeDifference1,
      timeDifference2: _patient?.timeDifference2,
      symptomHead: _patient?.symptomHead ?? 0,
      symptomEye: _patient?.symptomEye ?? 0,
      symptomFace: _patient?.symptomFace ?? 0,
      symptomArm: _patient?.symptomArm ?? 0,
      symptomSpeech: _patient?.symptomSpeech ?? 0,
      symptomVisual: _patient?.symptomVisual ?? 0,
      symptomAphasia: _patient?.symptomAphasia ?? 0,
      symptomNeglect: _patient?.symptomNeglect ?? 0,
      selectedDiseases: _patient?.selectedDiseases ?? '',
      scoreDiseases: _patient?.scoreDiseases ?? 0,
      ctBrain: _patient?.ctBrain,
      ctBrainText: _patient?.ctBrainText,
      totalScore: _totalScore,
      selectedScore1: _patient?.selectedScore1 ?? 0,
      selectedScore2: _patient?.selectedScore2 ?? 0,
      selectedScore3: _patient?.selectedScore3 ?? 0,
      selectedScore4: _selectedScore,
      selectedScore5: _patient?.selectedScore5 ?? 0,
      selectedScore6: _patient?.selectedScore6 ?? 0,
      selectedScore7: _patient?.selectedScore7 ?? 0,
      selectedScore8: _patient?.selectedScore8 ?? 0,
      selectedScore9: _patient?.selectedScore9 ?? 0,
      selectedScore10: _patient?.selectedScore10 ?? 0,
      selectedScore11: _patient?.selectedScore11 ?? 0,
      selectedScore12: _patient?.selectedScore12 ?? 0,
      selectedScore13: _patient?.selectedScore13 ?? 0,
      selectedScore14: _patient?.selectedScore14 ?? 0,
      selectedScore15: _patient?.selectedScore15 ?? 0,
      selectedText1: _patient?.selectedText1 ?? '',
      selectedText2: _patient?.selectedText2 ?? '',
      selectedText3: _patient?.selectedText3 ?? '',
      selectedText4: _selectedText,
      selectedText5: _patient?.selectedText5 ?? '',
      selectedText6: _patient?.selectedText6 ?? '',
      selectedText7: _patient?.selectedText7 ?? '',
      selectedText8: _patient?.selectedText8 ?? '',
      selectedText9: _patient?.selectedText9 ?? '',
      selectedText10: _patient?.selectedText10 ?? '',
      selectedText11: _patient?.selectedText11 ?? '',
      selectedText12: _patient?.selectedText12 ?? '',
      selectedText13: _patient?.selectedText13 ?? '',
      selectedText14: _patient?.selectedText14 ?? '',
      selectedText15: _patient?.selectedText15 ?? '',
      nihssLevel: nihssLevel,
      indications1: _patient?.indications1 ?? 0,
      indications2: _patient?.indications2 ?? 0,
      indications3: _patient?.indications3 ?? 0,
      strictlyprohibited1: _patient?.strictlyprohibited1 ?? 0,
      strictlyprohibited2: _patient?.strictlyprohibited2 ?? 0,
      strictlyprohibited3: _patient?.strictlyprohibited3 ?? 0,
      strictlyprohibited4: _patient?.strictlyprohibited4 ?? 0,
      strictlyprohibited5: _patient?.strictlyprohibited5 ?? 0,
      strictlyprohibited6: _patient?.strictlyprohibited6 ?? 0,
      strictlyprohibited7: _patient?.strictlyprohibited7 ?? 0,
      strictlyprohibited8: _patient?.strictlyprohibited8 ?? 0,
      strictlyprohibited9: _patient?.strictlyprohibited9 ?? 0,
      strictlyprohibited10: _patient?.strictlyprohibited10 ?? 0,
      strictlyprohibited11: _patient?.strictlyprohibited11 ?? 0,
      strictlyprohibited12: _patient?.strictlyprohibited12 ?? 0,
      strictlyprohibited13: _patient?.strictlyprohibited13 ?? 0,
      strictlyprohibited14: _patient?.strictlyprohibited14 ?? 0,
      strictlynotprohibited1: _patient?.strictlynotprohibited1 ?? 0,
      strictlynotprohibited2: _patient?.strictlynotprohibited2 ?? 0,
      strictlynotprohibited3: _patient?.strictlynotprohibited3 ?? 0,
      strictlynotprohibited4: _patient?.strictlynotprohibited4 ?? 0,
      strictlynotprohibited5: _patient?.strictlynotprohibited5 ?? 0,
      strictlynotprohibited6: _patient?.strictlynotprohibited6 ?? 0,
      additionalprohibitions1: _patient?.additionalprohibitions1 ?? 0,
      additionalprohibitions2: _patient?.additionalprohibitions2 ?? 0,
      additionalprohibitions3: _patient?.additionalprohibitions3 ?? 0,
      additionalprohibitions4: _patient?.additionalprohibitions4 ?? 0,
      medic1: _patient?.medic1 ?? 0,
      medic2: _patient?.medic2 ?? 0,
      medic3: _patient?.medic3 ?? 0,
      beforecure: _patient?.beforecure ?? '',
      aftercure: _patient?.aftercure ?? '',
      recordedTime1: _patient?.recordedTime1,
      recordedTime2: _patient?.recordedTime2,
      rtpa: _patient?.rtpa ?? '',
    );

    // อัปเดตใน SharedPreferences
    patientList[widget.patientId] = json.encode(updatedPatient.toMap());
    await prefs.setStringList('patients', patientList);

    Navigator.pop(context);
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

    String questionText = "ข้อที่ 2 การเคลื่อนไหวของตา\n(Best Gaze)";
    List<String> _questions = [
      "มองตามได้เป็นปกติ",
      "เหลือบมองไปด้านข้างได้เเต่ไม่สุด",
      "เหลือบตามองด้านข้างไม่ได้เลย"
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
                            SizedBox(height: screenHeight * 0.05),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _questions.length,
                              itemBuilder: (BuildContext context, int index) {
                                String text = _questions[index];
                                return GestureDetector(
                                  onTap: () =>
                                      _updatePatientData(_scores[index], text),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _selectedText.isEmpty
                                          ? const Color(0xFFC5CAE9)
                                          : _selectedText == text
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
                                          '   ${_scores[index]}     ',
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
