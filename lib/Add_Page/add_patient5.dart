import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient10.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions1.dart';
import 'package:hospital_app/AdditionalProhibitions/AdditionalProhibitions2.dart';
import 'package:hospital_app/Provider/Paddpatient5.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited1.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited2.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited3.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited4.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited5.dart';
import 'package:hospital_app/StrictlyNotProhibited/StrictlyNotProhibited6.dart';
import 'package:provider/provider.dart';

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
  final int totalScore;
  final String nihssLevel;

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
    required this.totalScore,
    required this.nihssLevel,
  });

  @override
  State<AddPatient5> createState() => _AddPatient5State();
}

class _AddPatient5State extends State<AddPatient5> {
  late int initialStrictlynotprohibited1;
  late int initialStrictlynotprohibited2;
  late int initialStrictlynotprohibited3;
  late int initialStrictlynotprohibited4;
  late int initialStrictlynotprohibited5;
  late int initialStrictlynotprohibited6;
  late int initialAdditionalprohibitions1;
  late int initialAdditionalprohibitions2;
  late int initialAdditionalprohibitions3;
  double medic1 = 0.0;
  double medic2 = 0.0;
  double medic3 = 0.0;
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

  TextEditingController beforecure = TextEditingController();
  TextEditingController aftercure = TextEditingController();

  @override
  void initState() {
    super.initState();
    final paddPatient5 = Provider.of<Paddpatient5>(context, listen: false);
    initialStrictlynotprohibited1 = paddPatient5.strictlynotprohibited1;
    initialStrictlynotprohibited2 = paddPatient5.strictlynotprohibited2;
    initialStrictlynotprohibited3 = paddPatient5.strictlynotprohibited3;
    initialStrictlynotprohibited4 = paddPatient5.strictlynotprohibited4;
    initialStrictlynotprohibited5 = paddPatient5.strictlynotprohibited5;
    initialStrictlynotprohibited6 = paddPatient5.strictlynotprohibited6;
    initialAdditionalprohibitions1 = paddPatient5.additionalprohibitions1;
    initialAdditionalprohibitions2 = paddPatient5.additionalprohibitions2;
    initialAdditionalprohibitions3 = paddPatient5.additionalprohibitions3;

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

  // void updateAdditionalProhibitions1(bool? value, bool isnihssLess) {
  //   setState(() {
  //     if (isnihssLess) {
  //       nihssLess = value ?? false;
  //       nihssMore = !nihssLess;
  //     } else {
  //       nihssMore = value ?? false;
  //       nihssLess = !nihssMore;
  //     }
  //     additionalprohibitions1 = nihssLess ? 1 : 0;
  //   });
  // }

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
    final paddPatient5 = Provider.of<Paddpatient5>(context);

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
                              paddPatient5.strictlynotprohibited1 = value;
                            });
                          },
                          initialStrictlynotprohibited1:
                              initialStrictlynotprohibited1,
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited3(
                          onChanged: (value) {
                            setState(() {
                              paddPatient5.strictlynotprohibited3 = value;
                            });
                          },
                          initialStrictlynotprohibited3:
                              initialStrictlynotprohibited3,
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited4(
                          onChanged: (value) {
                            setState(() {
                              paddPatient5.strictlynotprohibited4 = value;
                            });
                          },
                          initialStrictlynotprohibited4:
                              initialStrictlynotprohibited4,
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited5(
                          onChanged: (value) {
                            setState(() {
                              paddPatient5.strictlynotprohibited5 = value;
                            });
                          },
                          initialStrictlynotprohibited5:
                              initialStrictlynotprohibited5,
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited6(
                          onChanged: (value) {
                            setState(() {
                              paddPatient5.strictlynotprohibited6 = value;
                            });
                          },
                          initialStrictlynotprohibited6:
                              initialStrictlynotprohibited6,
                        ),
                        SizedBox(height: height * 0.02),
                        StrictlyNotProhibited2(
                          onChanged: (value) {
                            setState(() {
                              paddPatient5.strictlynotprohibited2 = value;
                            });
                          },
                          initialStrictlynotprohibited2:
                              initialStrictlynotprohibited2,
                        ),
                        SizedBox(height: height * 0.02),
                        AdditionalProhibitions2(
                          onChanged: (value) {
                            setState(() {
                              paddPatient5.additionalprohibitions2 = value;
                            });
                          },
                          initialAdditionalprohibitions2:
                              initialAdditionalprohibitions2,
                        ),
                        SizedBox(height: height * 0.02),
                        AdditionalProhibitions1(
                          onChanged: (value) {
                            setState(() {
                              paddPatient5.additionalprohibitions1 = value;
                            });
                          },
                          initialAdditionalprohibitions1:
                              initialAdditionalprohibitions1,
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
                          totalScore: widget.totalScore,
                          nihssLevel: widget.nihssLevel,
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
