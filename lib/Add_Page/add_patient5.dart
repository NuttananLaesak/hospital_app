import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient10.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions1.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions2.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited1.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited2.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited3.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited4.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited5.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited6.dart';

class AddPatient5 extends StatefulWidget {
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

  const AddPatient5({
    super.key,
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
  });

  @override
  State<AddPatient5> createState() => _AddPatient5State();
}

class _AddPatient5State extends State<AddPatient5> {
  int strictlynotprohibited1 = -1;
  int strictlynotprohibited2 = -1;
  int strictlynotprohibited3 = -1;
  int strictlynotprohibited4 = -1;
  int strictlynotprohibited5 = -1;
  int strictlynotprohibited6 = -1;
  late bool nihssLess;
  late bool nihssMore;
  int additionalprohibitions1 = -1;
  int additionalprohibitions2 = -1;
  late bool age2Less;
  late bool age2sMore;
  int additionalprohibitions3 = -1;
  int additionalprohibitions4 = -1;
  double medic1 = 0.0;
  double medic2 = 0.0;
  double medic3 = 0.0;
  TextEditingController beforecure = TextEditingController();
  TextEditingController aftercure = TextEditingController();

  @override
  void initState() {
    super.initState();
    int scorenihss = widget.totalScore;
    if (scorenihss == 0) {
      additionalprohibitions1 = -1;
      nihssLess = false;
      nihssMore = false;
    } else {
      nihssLess = scorenihss <= 24;
      nihssMore = scorenihss >= 25;
      additionalprohibitions1 = nihssLess ? 1 : 0;
    }
    int age2 = int.tryParse(widget.ageController.text) ?? 0;
    if (age2 == 0) {
      additionalprohibitions3 = -1;
      age2Less = false;
      age2sMore = false;
    } else {
      age2Less = age2 <= 79;
      age2sMore = age2 >= 80;
      additionalprohibitions3 = age2Less ? 1 : 0;
    }
  }

  void updateAdditionalProhibitions1(bool? value, bool isnihssLess) {
    setState(() {
      if (isnihssLess) {
        nihssLess = value ?? false;
        nihssMore = !nihssLess;
      } else {
        nihssMore = value ?? false;
        nihssLess = !nihssMore;
      }
      additionalprohibitions1 = nihssLess ? 1 : 0;
    });
  }

  void updateAdditionalProhibitions3(bool? value, bool isage2Less) {
    setState(() {
      if (isage2Less) {
        age2Less = value ?? false;
        age2sMore = !age2Less;
      } else {
        age2sMore = value ?? false;
        age2Less = !age2sMore;
      }
      additionalprohibitions3 = age2Less ? 1 : 0;
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
            'ข้อห้าม/ข้อบ่งชี้',
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
                          'ข้อห้ามที่ไม่ถือว่า\nห้ามอย่างเด็ดขาด',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.04),
                        StrictlyNotProhibited1(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited1 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited3(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited4(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited4 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited5(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited5 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited6(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited6 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited2(
                          onChanged: (value) {
                            setState(() {
                              strictlynotprohibited2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        AdditionalProhibitions2(
                          onChanged: (value) {
                            setState(() {
                              additionalprohibitions2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        AdditionalProhibitions1(
                          nihssLess: nihssLess,
                          nihssMore: nihssMore,
                          nihssLessChanged: (value) =>
                              updateAdditionalProhibitions1(value, true),
                          nihssMoreChanged: (value) =>
                              updateAdditionalProhibitions1(value, false),
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
                        builder: (context) => AddPatient10(
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
                          indications1: widget.indications1,
                          indications2: widget.indications2,
                          indications3: widget.indications3,
                          strictlyprohibited1: widget.strictlyprohibited1,
                          strictlyprohibited2: widget.strictlyprohibited2,
                          strictlyprohibited3: widget.strictlyprohibited3,
                          strictlyprohibited4: widget.strictlyprohibited4,
                          strictlyprohibited5: widget.strictlyprohibited5,
                          strictlyprohibited6: widget.strictlyprohibited6,
                          strictlyprohibited7: widget.strictlyprohibited7,
                          strictlyprohibited8: widget.strictlyprohibited8,
                          strictlyprohibited9: widget.strictlyprohibited9,
                          strictlyprohibited10: widget.strictlyprohibited10,
                          strictlyprohibited11: widget.strictlyprohibited11,
                          strictlyprohibited12: widget.strictlyprohibited12,
                          strictlyprohibited13: widget.strictlyprohibited13,
                          strictlyprohibited14: widget.strictlyprohibited14,
                          strictlynotprohibited1: strictlynotprohibited1,
                          strictlynotprohibited2: strictlynotprohibited2,
                          strictlynotprohibited3: strictlynotprohibited3,
                          strictlynotprohibited4: strictlynotprohibited4,
                          strictlynotprohibited5: strictlynotprohibited5,
                          strictlynotprohibited6: strictlynotprohibited6,
                          additionalprohibitions1: additionalprohibitions1,
                          additionalprohibitions2: additionalprohibitions2,
                          additionalprohibitions3: additionalprohibitions3,
                          additionalprohibitions4: additionalprohibitions4,
                          medic1: medic1,
                          medic2: medic2,
                          medic3: medic3,
                          beforecure: beforecure,
                          aftercure: aftercure,
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
