import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient2.dart';
import 'package:hospital_app/Add_Patient/age_input.dart';
import 'package:hospital_app/Add_Patient/blood_input.dart';
import 'package:hospital_app/Add_Patient/date_selection1.dart';
import 'package:hospital_app/Add_Patient/date_selection2.dart';
import 'package:hospital_app/Add_Patient/date_selection3.dart';
import 'package:hospital_app/Add_Patient/gender_selection.dart';
import 'package:hospital_app/Add_Patient/hospital_input.dart';
import 'package:hospital_app/Add_Patient/name_input.dart';
import 'package:hospital_app/Add_Patient/sugar_input.dart';
import 'package:hospital_app/Add_Patient/weight_input.dart';
import 'package:hospital_app/Provider/Paddpatient2.dart';
import 'package:hospital_app/Provider/Paddpatient3.dart';
import 'package:hospital_app/Provider/Paddpatient4.dart';
import 'package:hospital_app/Provider/Paddpatient5.dart';
import 'package:hospital_app/Provider/Pquiz.dart';
import 'package:provider/provider.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TextEditingController nameController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String gender = '';
  TextEditingController weightController = TextEditingController();
  TextEditingController systolicBloodPressureController =
      TextEditingController();
  TextEditingController diastolicBloodPressureController =
      TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController dateTimeController1 = TextEditingController();
  TextEditingController dateTimeController2 = TextEditingController();
  TextEditingController dateTimeController3 = TextEditingController();
  Duration timeDifference1 = Duration.zero;
  Duration timeDifference2 = Duration.zero;

  void updateGender(String newGender) {
    setState(() {
      gender = newGender;
    });
  }

  void calculateTimeDifference() {
    if (dateTimeController1.text.isNotEmpty &&
        dateTimeController2.text.isNotEmpty) {
      TimeOfDay time1 = _parseTime(dateTimeController1.text);
      TimeOfDay time2 = _parseTime(dateTimeController2.text);

      Duration difference1 = _getTimeDifference(time1, time2);

      setState(() {
        timeDifference1 = difference1;
      });
    } else {
      setState(() {
        timeDifference1 = Duration.zero;
      });
    }

    if (dateTimeController2.text.isNotEmpty &&
        dateTimeController3.text.isNotEmpty) {
      TimeOfDay time2 = _parseTime(dateTimeController2.text);
      TimeOfDay time3 = _parseTime(dateTimeController3.text);

      Duration difference2 = _getTimeDifference(time2, time3);

      setState(() {
        timeDifference2 = difference2;
      });
    } else {
      setState(() {
        timeDifference2 = Duration.zero;
      });
    }
  }

  TimeOfDay _parseTime(String timeString) {
    final timeParts = timeString.split(', ')[1].split(' ')[1].split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  Duration _getTimeDifference(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;

    int differenceMinutes = endMinutes - startMinutes;

    if (differenceMinutes < 0) {
      differenceMinutes += 24 * 60; // Add 24 hours in minutes
    }

    return Duration(minutes: differenceMinutes);
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  void _showNameMissingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ข้อมูลไม่ครบถ้วน'),
          content: Text('กรุณากรอกชื่อผู้ป่วยก่อนดำเนินการต่อ'),
          actions: [
            TextButton(
              child: Text(
                'ตกลง',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onDateTimeChanged() {
    calculateTimeDifference();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final paddPatient2 = Provider.of<Paddpatient2>(context, listen: false);
    final paddPatient3 = Provider.of<Paddpatient3>(context, listen: false);
    final quiz = Provider.of<QuizModel>(context, listen: false);
    final paddpatient4 = Provider.of<Paddpatient4>(context, listen: false);
    final paddpatient5 = Provider.of<Paddpatient5>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFF82B1FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'เพิ่มข้อมูลผู้ป่วย',
            style: TextStyle(
                fontSize: height * 0.026, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              paddPatient2.resetSymptom();
              paddPatient3.resetCtBrainAndnDiseasesScore();
              quiz.resetScoresAndTexts();
              paddpatient4.resetIndicationsAndStrictlyprohibited();
              paddpatient5.resetAdditionalprohibitions();
              Navigator.pop(context);
            },
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF82B1FF),
              Color(0xFF82B1FF),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.04,
              width: width,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    bottom: height * 0.056),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.015),
                        Image.asset('images/nihss.png',
                            width: width * 0.5, height: height * 0.2),
                        NameInput(nameController: nameController),
                        HospitalInput(hospitalController: hospitalController),
                        AgeInput(controller: ageController),
                        GenderSelection(onGenderSelected: updateGender),
                        WeightInput(controller: weightController),
                        BloodInput(
                          systolicController: systolicBloodPressureController,
                          diastolicController: diastolicBloodPressureController,
                        ),
                        SugarInput(controller: sugarController),
                        DatetimeSelection1(
                          controller: dateTimeController1,
                          onDateChanged: _onDateTimeChanged,
                        ),
                        DatetimeSelection2(
                          controller: dateTimeController2,
                          onDateChanged: _onDateTimeChanged,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.03, bottom: height * 0.02),
                          child: Text(
                            'เวลาเมีอมีอาการมาโรงพยาบาล\nใช้ระยะเวลา : ${_formatDuration(timeDifference1)} ชม.',
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DatetimeSelection3(
                          controller: dateTimeController3,
                          onDateChanged: _onDateTimeChanged,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.03, bottom: height * 0.02),
                          child: Text(
                            'เวลาเมื่อมาโรงพยาบาลเเล้วฉีดยา\nใช้ระยะวลา : ${_formatDuration(timeDifference2)} ชม.',
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.03, bottom: height * 0.03),
                          child: ElevatedButton(
                            onPressed: () {
                              if (nameController.text.isEmpty) {
                                _showNameMissingDialog();
                              } else {
                                double _convertDurationToDecimal(
                                    Duration duration) {
                                  int hours = duration.inHours;
                                  int minutes =
                                      duration.inMinutes.remainder(60);
                                  double minutesFraction = minutes / 100.0;
                                  return hours + minutesFraction;
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Add_Patient2(
                                      nameController: nameController,
                                      hospitalController: hospitalController,
                                      ageController: ageController,
                                      gender: gender,
                                      weightController: weightController,
                                      systolicBloodPressureController:
                                          systolicBloodPressureController,
                                      diastolicBloodPressureController:
                                          diastolicBloodPressureController,
                                      sugarController: sugarController,
                                      dateTimeController1: dateTimeController1,
                                      dateTimeController2: dateTimeController2,
                                      dateTimeController3: dateTimeController3,
                                      timeDifference1:
                                          _convertDurationToDecimal(
                                              timeDifference1),
                                      timeDifference2:
                                          _convertDurationToDecimal(
                                              timeDifference2),
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF82B1FF)),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(150, 70)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
