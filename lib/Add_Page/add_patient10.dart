import 'package:flutter/material.dart';
import 'package:hospital_app/sql_lite.dart';

class AddPatient10 extends StatefulWidget {
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
  final TextEditingController beforecure;
  final TextEditingController aftercure;

  const AddPatient10(
      {Key? key,
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
      required this.aftercure})
      : super(key: key);

  @override
  State<AddPatient10> createState() => _AddPatient10State();
}

class _AddPatient10State extends State<AddPatient10> {
  final SqllLiteManage _databaseManager = SqllLiteManage();

  @override
  void initState() {
    super.initState();
    _databaseManager.openOrCreateDatabase();
  }

  Future<void> _savePatientData() async {
    String name = widget.nameController.text;
    String hospital = widget.hospitalController.text;
    int age = int.tryParse(widget.ageController.text) ?? 0;
    String gender = widget.gender;
    String weight = widget.weightController.text;
    String systolicBloodPressure = widget.systolicBloodPressureController.text;
    String diastolicBloodPressure =
        widget.diastolicBloodPressureController.text;
    String sugar = widget.sugarController.text;
    String dateTime1 = widget.dateTimeController1.text;
    String dateTime2 = widget.dateTimeController2.text;
    String dateTime3 = widget.dateTimeController3.text;
    int symptomHead = widget.symptomHead;
    int symptomEye = widget.symptomEye;
    int symptomFace = widget.symptomFace;
    int symptomArm = widget.symptomArm;
    int symptomSpeech = widget.symptomSpeech;
    int symptomVisual = widget.symptomVisual;
    int symptomAphasia = widget.symptomAphasia;
    int symptomNeglect = widget.symptomNeglect;
    String selectedDiseases = widget.selectedDiseases;
    int? ctBrain = widget.ctBrain;
    int totalScore = widget.totalScore;
    int selectedScore1 = widget.selectedScore1;
    String selectedText1 = widget.selectedText1;
    int selectedScore2 = widget.selectedScore2;
    String selectedText2 = widget.selectedText2;
    int selectedScore3 = widget.selectedScore3;
    String selectedText3 = widget.selectedText3;
    int selectedScore4 = widget.selectedScore4;
    String selectedText4 = widget.selectedText4;
    int selectedScore5 = widget.selectedScore5;
    String selectedText5 = widget.selectedText5;
    int selectedScore6 = widget.selectedScore6;
    String selectedText6 = widget.selectedText6;
    int selectedScore7 = widget.selectedScore7;
    String selectedText7 = widget.selectedText7;
    int selectedScore8 = widget.selectedScore8;
    String selectedText8 = widget.selectedText8;
    int selectedScore9 = widget.selectedScore9;
    String selectedText9 = widget.selectedText9;
    int selectedScore10 = widget.selectedScore10;
    String selectedText10 = widget.selectedText10;
    int selectedScore11 = widget.selectedScore11;
    String selectedText11 = widget.selectedText11;
    int selectedScore12 = widget.selectedScore12;
    String selectedText12 = widget.selectedText12;
    int selectedScore13 = widget.selectedScore13;
    String selectedText13 = widget.selectedText13;
    int selectedScore14 = widget.selectedScore14;
    String selectedText14 = widget.selectedText14;
    int selectedScore15 = widget.selectedScore15;
    String selectedText15 = widget.selectedText15;
    String nihssLevel = widget.nihssLevel;
    int indications1 = widget.indications1;
    int indications2 = widget.indications2;
    int indications3 = widget.indications3;
    int strictlyprohibited1 = widget.strictlyprohibited1;
    int strictlyprohibited2 = widget.strictlyprohibited2;
    int strictlyprohibited3 = widget.strictlyprohibited3;
    int strictlyprohibited4 = widget.strictlyprohibited4;
    int strictlyprohibited5 = widget.strictlyprohibited5;
    int strictlyprohibited6 = widget.strictlyprohibited6;
    int strictlyprohibited7 = widget.strictlyprohibited7;
    int strictlyprohibited8 = widget.strictlyprohibited8;
    int strictlyprohibited9 = widget.strictlyprohibited9;
    int strictlyprohibited10 = widget.strictlyprohibited10;
    int strictlyprohibited11 = widget.strictlyprohibited11;
    int strictlynotprohibited1 = widget.strictlynotprohibited1;
    int strictlynotprohibited2 = widget.strictlynotprohibited2;
    int strictlynotprohibited3 = widget.strictlynotprohibited3;
    int strictlynotprohibited4 = widget.strictlynotprohibited4;
    int strictlynotprohibited5 = widget.strictlynotprohibited5;
    int strictlynotprohibited6 = widget.strictlynotprohibited6;
    int additionalprohibitions1 = widget.additionalprohibitions1;
    int additionalprohibitions2 = widget.additionalprohibitions2;
    int additionalprohibitions3 = widget.additionalprohibitions3;
    int additionalprohibitions4 = widget.additionalprohibitions4;
    double? timeDifference1 = widget.timeDifference1;
    double? timeDifference2 = widget.timeDifference2;
    double medic1 = widget.medic1;
    double medic2 = widget.medic2;
    double medic3 = widget.medic3;
    String beforeCure = widget.beforecure.text;
    String afterCure = widget.aftercure.text;
    String? ctBrainText = widget.ctBrainText;

    String sql =
        "INSERT INTO Patient (PatientName, Hospital, Age, Gender, Weight, SystolicBloodPressure, DiastolicBloodPressure, "
        "Sugar, DateTime1, DateTime2, DateTime3, SymptomHead, SymptomEye, SymptomFace, SymptomArm, SymptomSpeech, "
        "SymptomVisual, SymptomAphasia, SymptomNeglect, SelectedDiseases, CTBrain, TotalScore, SelectedScore1, SelectedText1, "
        "SelectedScore2, SelectedText2, SelectedScore3, SelectedText3, SelectedScore4, SelectedText4, SelectedScore5, "
        "SelectedText5, SelectedScore6, SelectedText6, SelectedScore7, SelectedText7, SelectedScore8, SelectedText8, "
        "SelectedScore9, SelectedText9, SelectedScore10, SelectedText10, SelectedScore11, SelectedText11, SelectedScore12, "
        "SelectedText12, SelectedScore13, SelectedText13, SelectedScore14, SelectedText14, SelectedScore15, SelectedText15, "
        "NIHSSLevel, Indications1, Indications2, Indications3, StrictlyProhibited1, StrictlyProhibited2, StrictlyProhibited3, "
        "StrictlyProhibited4, StrictlyProhibited5, StrictlyProhibited6, StrictlyProhibited7, StrictlyProhibited8, StrictlyProhibited9, "
        "StrictlyProhibited10, StrictlyProhibited11, StrictlyNotProhibited1, StrictlyNotProhibited2, StrictlyNotProhibited3, "
        "StrictlyNotProhibited4, StrictlyNotProhibited5, StrictlyNotProhibited6, AdditionalProhibitions1, AdditionalProhibitions2, "
        "AdditionalProhibitions3, AdditionalProhibitions4, TimeDifference1, TimeDifference2, Medic1, Medic2, Medic3, BeforeCure, AfterCure, CTBrainText) "
        "VALUES ('$name','$hospital', $age, '$gender', '$weight', '$systolicBloodPressure', '$diastolicBloodPressure', "
        "'$sugar', '$dateTime1', '$dateTime2', '$dateTime3', $symptomHead, $symptomEye, $symptomFace, $symptomArm, "
        "$symptomSpeech, $symptomVisual, $symptomAphasia, $symptomNeglect, '$selectedDiseases', "
        "$ctBrain, $totalScore, $selectedScore1, '$selectedText1', $selectedScore2, '$selectedText2', "
        "$selectedScore3, '$selectedText3', $selectedScore4, '$selectedText4', $selectedScore5, '$selectedText5', "
        "$selectedScore6, '$selectedText6', $selectedScore7, '$selectedText7', $selectedScore8, '$selectedText8', "
        "$selectedScore9, '$selectedText9', $selectedScore10, '$selectedText10', $selectedScore11, '$selectedText11', "
        "$selectedScore12, '$selectedText12', $selectedScore13, '$selectedText13', $selectedScore14, '$selectedText14', "
        "$selectedScore15, '$selectedText15', '$nihssLevel', $indications1, $indications2, $indications3, "
        "$strictlyprohibited1, $strictlyprohibited2, $strictlyprohibited3, $strictlyprohibited4, $strictlyprohibited5, "
        "$strictlyprohibited6, $strictlyprohibited7, $strictlyprohibited8, $strictlyprohibited9, $strictlyprohibited10, "
        "$strictlyprohibited11, $strictlynotprohibited1, $strictlynotprohibited2, $strictlynotprohibited3, $strictlynotprohibited4, "
        "$strictlynotprohibited5, $strictlynotprohibited6, $additionalprohibitions1, $additionalprohibitions2, "
        "$additionalprohibitions3, $additionalprohibitions4, $timeDifference1, $timeDifference2, $medic1, $medic2, $medic3, '$beforeCure', '$afterCure', '$ctBrainText')";

    await _databaseManager.insertDatabase(sql);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: Color(0xFF82B1FF),
          centerTitle: true,
          title: const Text(
            'ประเมินผล',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double padding = constraints.maxWidth * 0.05;
          double fontSizeTitle = constraints.maxWidth * 0.06;
          double fontSizeContent = constraints.maxWidth * 0.045;
          double spacing = constraints.maxHeight * 0.02;

          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 130),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NIHSS ${widget.totalScore} คะเเนน',
                      style: TextStyle(
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.bold,
                        color: widget.totalScore == 0
                            ? Colors.green
                            : (widget.totalScore >= 1 && widget.totalScore <= 4)
                                ? Colors.yellow[600]
                                : (widget.totalScore >= 5 &&
                                        widget.totalScore <= 15)
                                    ? Colors.orange
                                    : (widget.totalScore >= 16 &&
                                            widget.totalScore <= 20)
                                        ? Colors.amber[900]
                                        : (widget.totalScore >= 21)
                                            ? Colors.red
                                            : Colors.black,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    '${widget.nihssLevel}',
                    style: TextStyle(fontSize: fontSizeContent),
                  ),
                ),
                SizedBox(height: spacing * 1.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/dash.png',
                      width: constraints.maxWidth * 0.5,
                      height: constraints.maxWidth * 0.5,
                    ),
                  ],
                ),
                SizedBox(height: spacing * 2),
                Text(
                  'ชื่อ : ${widget.nameController.text.isNotEmpty ? widget.nameController.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'โรงพยาบาล : ${widget.hospitalController.text.isNotEmpty ? widget.hospitalController.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'อายุ : ${widget.ageController.text.isNotEmpty ? widget.ageController.text : 'ไม่ระบุ'} ปี',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'เพศ : ${widget.gender.isNotEmpty ? widget.gender : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'น้ำหนัก : ${widget.weightController.text.isNotEmpty ? widget.weightController.text : 'ไม่ระบุ'} กิโลกรัม',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'ความดันโลหิต : ${widget.systolicBloodPressureController.text.isNotEmpty ? widget.systolicBloodPressureController.text : 'ไม่ระบุ'} / ${widget.diastolicBloodPressureController.text.isNotEmpty ? widget.diastolicBloodPressureController.text : 'ไม่ระบุ'} mmHg',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing),
                Text(
                  'ระดับน้ำตาล: ${widget.sugarController.text.isNotEmpty ? widget.sugarController.text : 'ไม่ระบุ'} mg/dl',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาเริ่มมีอาการ : ${widget.dateTimeController1.text.isNotEmpty ? widget.dateTimeController1.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาถึงโรงพยาบาล : ${widget.dateTimeController2.text.isNotEmpty ? widget.dateTimeController2.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาได้รับยาลิ่มเลือด: ${widget.dateTimeController3.text.isNotEmpty ? widget.dateTimeController3.text : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาเมื่ออาการมาโรงพยาบาล: ${widget.timeDifference1 != null ? '${widget.timeDifference1!.toStringAsFixed(2)} ชั่วโมง' : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'เวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา: ${widget.timeDifference2 != null ? '${widget.timeDifference2!.toStringAsFixed(2)} ชั่วโมง' : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'โรคประจำตัว: ${widget.selectedDiseases.isNotEmpty ? widget.selectedDiseases : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                Text(
                  'CT brain : ${widget.ctBrain != null ? widget.ctBrainText : 'ไม่ระบุ'}',
                  style: TextStyle(fontSize: fontSizeContent),
                ),
                SizedBox(height: spacing * 1.5),
                SizedBox(height: spacing * 2.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await _savePatientData();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/patientList', (route) => false);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF82B1FF)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(150, 70)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'บันทึกข้อมูลผู้ป่วย',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing * 1.5),
              ],
            ),
          );
        },
      ),
    );
  }
}
