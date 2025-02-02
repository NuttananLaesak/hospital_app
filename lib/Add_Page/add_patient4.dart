import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient5.dart';
import 'package:hospital_app/Indications/Indications1.dart';
import 'package:hospital_app/Indications/Indications2.dart';
import 'package:hospital_app/Indications/Indications3.dart';
import 'package:hospital_app/Provider/Paddpatient4.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited1.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited10.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited11.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited12.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited13.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited14.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited2.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited3.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited4.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited5.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited6.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited7.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited8.dart';
import 'package:hospital_app/StrictlyProhibited/Strictly_Prohibited9.dart';
import 'package:provider/provider.dart';

class AddPatient4 extends StatefulWidget {
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

  const AddPatient4({
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
    required this.totalScore,
    required this.nihssLevel,
  }) : super(key: key);

  @override
  State<AddPatient4> createState() => _AddPatient4State();
}

class _AddPatient4State extends State<AddPatient4> {
  late int initialIndications1;
  late int initialIndications2;
  late int initialIndications3;
  late int initialStrictlyprohibited1;
  late int initialStrictlyprohibited2;
  late int initialStrictlyprohibited3;
  late int initialStrictlyprohibited4;
  late int initialStrictlyprohibited5;
  late int initialStrictlyprohibited6;
  late int initialStrictlyprohibited7;
  late int initialStrictlyprohibited8;
  late int initialStrictlyprohibited9;
  late int initialStrictlyprohibited10;
  late int initialStrictlyprohibited11;
  late int initialStrictlyprohibited12;
  late int initialStrictlyprohibited13;
  late int initialStrictlyprohibited14;

  @override
  void initState() {
    super.initState();
    final paddPatient4 = Provider.of<Paddpatient4>(context, listen: false);
    initialIndications1 = paddPatient4.indications1;
    initialIndications2 = paddPatient4.indications2;
    initialIndications3 = paddPatient4.indications3;
    initialStrictlyprohibited1 = paddPatient4.strictlyprohibited1;
    initialStrictlyprohibited2 = paddPatient4.strictlyprohibited2;
    initialStrictlyprohibited3 = paddPatient4.strictlyprohibited3;
    initialStrictlyprohibited4 = paddPatient4.strictlyprohibited4;
    initialStrictlyprohibited5 = paddPatient4.strictlyprohibited5;
    initialStrictlyprohibited6 = paddPatient4.strictlyprohibited6;
    initialStrictlyprohibited7 = paddPatient4.strictlyprohibited7;
    initialStrictlyprohibited8 = paddPatient4.strictlyprohibited8;
    initialStrictlyprohibited9 = paddPatient4.strictlyprohibited9;
    initialStrictlyprohibited10 = paddPatient4.strictlyprohibited10;
    initialStrictlyprohibited11 = paddPatient4.strictlyprohibited11;
    initialStrictlyprohibited12 = paddPatient4.strictlyprohibited12;
    initialStrictlyprohibited13 = paddPatient4.strictlyprohibited13;
    initialStrictlyprohibited14 = paddPatient4.strictlyprohibited14;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final paddPatient4 = Provider.of<Paddpatient4>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ข้อบ่งชี้/ข้อห้าม',
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
                          'ข้อบ่งชี้',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.04),
                        Indictions2(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.indications2 = value;
                            });
                          },
                          initialIndications2: initialIndications2,
                        ),
                        SizedBox(height: height * 0.02),
                        Indications1(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.indications1 = value;
                            });
                          },
                          initialIndications1: initialIndications1,
                        ),
                        SizedBox(height: height * 0.02),
                        Indictions3(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.indications3 = value;
                            });
                          },
                          initialIndications3: initialIndications3,
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
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
                          "ข้อห้ามอย่างเด็ดขาด",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        Strictly_Prohibited7(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited7 = value;
                            });
                          },
                          initialStrictlyprohibited7:
                              initialStrictlyprohibited7,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited3(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited3 = value;
                            });
                          },
                          initialStrictlyprohibited3:
                              initialStrictlyprohibited3,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited4(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited4 = value;
                            });
                          },
                          initialStrictlyprohibited4:
                              initialStrictlyprohibited4,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited1(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited1 = value;
                            });
                          },
                          initialStrictlyprohibited1:
                              initialStrictlyprohibited1,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited9(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited9 = value;
                            });
                          },
                          initialStrictlyprohibited9:
                              initialStrictlyprohibited9,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited12(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited12 = value;
                            });
                          },
                          initialStrictlyprohibited12:
                              initialStrictlyprohibited12,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited13(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited13 = value;
                            });
                          },
                          initialStrictlyprohibited13:
                              initialStrictlyprohibited13,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited14(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited14 = value;
                            });
                          },
                          initialStrictlyprohibited14:
                              initialStrictlyprohibited14,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited11(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited11 = value;
                            });
                          },
                          initialStrictlyprohibited11:
                              initialStrictlyprohibited11,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited10(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited10 = value;
                            });
                          },
                          initialStrictlyprohibited10:
                              initialStrictlyprohibited10,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited6(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited6 = value;
                            });
                          },
                          initialStrictlyprohibited6:
                              initialStrictlyprohibited6,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited8(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited8 = value;
                            });
                          },
                          initialStrictlyprohibited8:
                              initialStrictlyprohibited8,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited2(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited2 = value;
                            });
                          },
                          initialStrictlyprohibited2:
                              initialStrictlyprohibited2,
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited5(
                          onChanged: (value) {
                            setState(() {
                              paddPatient4.strictlyprohibited5 = value;
                            });
                          },
                          initialStrictlyprohibited5:
                              initialStrictlyprohibited5,
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
                        builder: (context) => AddPatient5(
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
