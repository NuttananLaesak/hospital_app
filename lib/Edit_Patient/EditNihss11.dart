import 'package:flutter/material.dart';
import 'package:hospital_app/sql_lite.dart';

class EditNihss11 extends StatefulWidget {
  final int patientID;

  const EditNihss11({Key? key, required this.patientID}) : super(key: key);

  @override
  State<EditNihss11> createState() => _EditNihss11State();
}

class _EditNihss11State extends State<EditNihss11> {
  final SqllLiteManage _databaseManager = SqllLiteManage();
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

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    await _databaseManager.openOrCreateDatabase();
    List<Map<String, dynamic>> result = await _databaseManager.selectDatabase(
      "SELECT * FROM Patient WHERE ID = ${widget.patientID}",
    );

    if (result.isNotEmpty) {
      setState(() {
        _oldselectedScore = result.first['SelectedScore11'];
        _totalScore = result.first['TotalScore'];
      });
    }
  }

  Future<void> _updatePatientData(int score, String text) async {
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

    String updateQuery = "UPDATE Patient SET "
        "SelectedScore11 = $_selectedScore, "
        "SelectedText11 = '$_selectedText', "
        "TotalScore = '$_totalScore', "
        "NIHSSLevel = '$nihssLevel' "
        "WHERE ID = ${widget.patientID}";

    await _databaseManager.updateDatabase(updateQuery);

    Navigator.pop(context);
    _loadPatientData();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    String questionText = "ข้อที่ 7 การประสานของเเขนขา\n(Limb Ataxia)";
    List<String> _questions = [
      "การประสานงานของ\nเเขนขาทั้ง 2 ข้าง เป็นปกติ",
      "พบปัญหาของการประสานงาน\nของเเขนหรือขา 1 ข้าง",
      "พบปัญหาของการประสานงาน\nเเขนหรือขา 2 ข้าง",
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
