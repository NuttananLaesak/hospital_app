import 'package:flutter/material.dart';

class DiseaseSelection extends StatefulWidget {
  final Function(String) onDiseasesSelected;
  final Function(int) onDiseasesScore;
  final String initialValue1;
  final int initialValue2;

  const DiseaseSelection(
      {Key? key,
      required this.onDiseasesSelected,
      required this.onDiseasesScore,
      required this.initialValue1,
      required this.initialValue2})
      : super(key: key);

  @override
  _DiseaseSelectionState createState() => _DiseaseSelectionState();
}

class _DiseaseSelectionState extends State<DiseaseSelection> {
  String selectedDisease = ''; // ตัวแปรที่ใช้เก็บโรคที่เลือก
  int scoreDiseases = -1; // คะแนนที่ใช้ในการคำนวณ
  TextEditingController otherDiseaseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDisease = widget.initialValue1; // กำหนดค่าเริ่มต้น
    scoreDiseases = widget.initialValue2; // กำหนดค่าเริ่มต้น
    _setSelectedDisease();
    if (selectedDisease == 'อื่นๆ') {
      otherDiseaseController.text = widget.initialValue1; // Show initial value
    }
  }

  void _setSelectedDisease() {
    // กำหนดค่า selectedDisease ตาม scoreDiseases
    switch (scoreDiseases) {
      case 0:
        selectedDisease = 'ไม่มีโรคประจำตัว';
        break;
      case 1:
        selectedDisease = 'โรคเบาหวาน';
        break;
      case 2:
        selectedDisease = 'โรคความดันโลหิตสูง';
        break;
      case 3:
        selectedDisease = 'โรคไขมันในเลือดสูง';
        break;
      case 4:
        selectedDisease = 'โรคหลอดเลือดสมอง';
        break;
      case 5:
        selectedDisease = 'โรคหัวใจเต้นพลิ้ว';
        break;
      case 6:
        selectedDisease = 'อื่นๆ';
        break;
      default:
        selectedDisease = ''; // ไม่มีโรค
    }
    otherDiseaseController.text =
        (scoreDiseases == 6) ? '' : ''; // ล้างค่าในฟิลด์อื่นๆ
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: CheckboxListTile(
            title: Text(
              'ไม่มีโรคประจำตัว\n(No Underlying Disease)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: selectedDisease == 'ไม่มีโรคประจำตัว',
            activeColor: Color(0xFF304FFE),
            onChanged: (value) {
              setState(() {
                if (selectedDisease == 'ไม่มีโรคประจำตัว') {
                  selectedDisease = ''; // ยกเลิกการเลือก
                  scoreDiseases = -1; // คะแนนเป็น 0
                } else {
                  selectedDisease = 'ไม่มีโรคประจำตัว';
                  scoreDiseases = 0; // คะแนนสำหรับไม่มีโรค
                  otherDiseaseController.clear(); // ล้างค่าในฟิลด์อื่นๆ
                }
              });
              updateSelectedDiseases();
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคเบาหวาน\n(Diabetes Mellitus)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: selectedDisease == 'โรคเบาหวาน',
            activeColor: Color(0xFF304FFE),
            onChanged: (value) {
              setState(() {
                if (selectedDisease == 'โรคเบาหวาน') {
                  selectedDisease = ''; // ยกเลิกการเลือก
                  scoreDiseases = -1; // คะแนนเป็น 0
                } else {
                  selectedDisease = 'โรคเบาหวาน';
                  scoreDiseases = 1; // คะแนนสำหรับโรคเบาหวาน
                  otherDiseaseController.clear(); // ล้างค่าในฟิลด์อื่นๆ
                }
              });
              updateSelectedDiseases();
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคความดันโลหิตสูง\n(Hypertension)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: selectedDisease == 'โรคความดันโลหิตสูง',
            activeColor: Color(0xFF304FFE),
            onChanged: (value) {
              setState(() {
                if (selectedDisease == 'โรคความดันโลหิตสูง') {
                  selectedDisease = ''; // ยกเลิกการเลือก
                  scoreDiseases = -1; // คะแนนเป็น 0
                } else {
                  selectedDisease = 'โรคความดันโลหิตสูง';
                  scoreDiseases = 2; // คะแนนสำหรับความดันโลหิตสูง
                  otherDiseaseController.clear(); // ล้างค่าในฟิลด์อื่นๆ
                }
              });
              updateSelectedDiseases();
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคไขมันในเลือดสูง\n(Dyslipidemia)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: selectedDisease == 'โรคไขมันในเลือดสูง',
            activeColor: Color(0xFF304FFE),
            onChanged: (value) {
              setState(() {
                if (selectedDisease == 'โรคไขมันในเลือดสูง') {
                  selectedDisease = ''; // ยกเลิกการเลือก
                  scoreDiseases = -1; // คะแนนเป็น 0
                } else {
                  selectedDisease = 'โรคไขมันในเลือดสูง';
                  scoreDiseases = 3; // คะแนนสำหรับไขมันในเลือดสูง
                  otherDiseaseController.clear(); // ล้างค่าในฟิลด์อื่นๆ
                }
              });
              updateSelectedDiseases();
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคหลอดเลือดสมอง\n(Stroke)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: selectedDisease == 'โรคหลอดเลือดสมอง',
            activeColor: Color(0xFF304FFE),
            onChanged: (value) {
              setState(() {
                if (selectedDisease == 'โรคหลอดเลือดสมอง') {
                  selectedDisease = ''; // ยกเลิกการเลือก
                  scoreDiseases = -1; // คะแนนเป็น 0
                } else {
                  selectedDisease = 'โรคหลอดเลือดสมอง';
                  scoreDiseases = 4; // คะแนนสำหรับโรคหลอดเลือดสมอง
                  otherDiseaseController.clear(); // ล้างค่าในฟิลด์อื่นๆ
                }
              });
              updateSelectedDiseases();
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคหัวใจเต้นพลิ้ว\n(Atrial Fibrillation/Atrial Flutter)',
              style: TextStyle(fontSize: height * 0.017),
            ),
            value: selectedDisease == 'โรคหัวใจเต้นพลิ้ว',
            activeColor: Color(0xFF304FFE),
            onChanged: (value) {
              setState(() {
                if (selectedDisease == 'โรคหัวใจเต้นพลิ้ว') {
                  selectedDisease = ''; // ยกเลิกการเลือก
                  scoreDiseases = -1; // คะแนนเป็น 0
                } else {
                  selectedDisease = 'โรคหัวใจเต้นพลิ้ว';
                  scoreDiseases = 5; // คะแนนสำหรับโรคหัวใจเต้นพลิ้ว
                  otherDiseaseController.clear(); // ล้างค่าในฟิลด์อื่นๆ
                }
              });
              updateSelectedDiseases();
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'อื่นๆ',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: selectedDisease == 'อื่นๆ',
            activeColor: Color(0xFF304FFE),
            onChanged: (value) {
              setState(() {
                if (selectedDisease == 'อื่นๆ') {
                  selectedDisease = ''; // ยกเลิกการเลือก
                  scoreDiseases = -1; // คะแนนเป็น 0
                } else {
                  selectedDisease = 'อื่นๆ';
                  scoreDiseases = 6; // คะแนนสำหรับโรคอื่นๆ
                }
              });
              updateSelectedDiseases();
            },
          ),
        ),
        if (selectedDisease == 'อื่นๆ')
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: otherDiseaseController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'โปรดระบุโรค',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Color(0xFF304FFE)),
                ),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (String text) {
                updateSelectedDiseases();
              },
            ),
          ),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  void updateSelectedDiseases() {
    // เช็คว่าถ้า selectedDisease เป็น "อื่นๆ" ให้ใช้ค่าจาก otherDiseaseController แทน
    String finalDisease = selectedDisease == 'อื่นๆ'
        ? otherDiseaseController.text
        : selectedDisease;

    widget.onDiseasesSelected(finalDisease);
    widget.onDiseasesScore(scoreDiseases);
  }
}
