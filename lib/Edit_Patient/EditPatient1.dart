import 'package:flutter/material.dart';
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
import 'package:hospital_app/Edit_Patient/EditPatient2.dart';
import 'package:hospital_app/sql_lite.dart';

class EditPatient1 extends StatefulWidget {
  final int patientID;

  EditPatient1({required this.patientID});

  @override
  _EditPatient1State createState() => _EditPatient1State();
}

class _EditPatient1State extends State<EditPatient1> {
  final SqllLiteManage _databaseManager = SqllLiteManage();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _hospitalController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  String _gender = '';
  TextEditingController _weightController = TextEditingController();
  TextEditingController _systolicBloodPressureController =
      TextEditingController();
  TextEditingController _diastolicBloodPressureController =
      TextEditingController();
  TextEditingController _sugarController = TextEditingController();
  TextEditingController _dateTimeController1 = TextEditingController();
  TextEditingController _dateTimeController2 = TextEditingController();
  TextEditingController _dateTimeController3 = TextEditingController();
  double _timeDifference1 = 0.0;
  double _timeDifference2 = 0.0;

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
        _nameController.text = result.first['PatientName'];
        _hospitalController.text = result.first['Hospital'];
        _ageController.text = result.first['Age'].toString();
        _gender = result.first['Gender'];
        _weightController.text = result.first['Weight'];
        _systolicBloodPressureController.text =
            result.first['SystolicBloodPressure'];
        _diastolicBloodPressureController.text =
            result.first['DiastolicBloodPressure'];
        _sugarController.text = result.first['Sugar'];
        _dateTimeController1.text = result.first['DateTime1'];
        _dateTimeController2.text = result.first['DateTime2'];
        _dateTimeController3.text = result.first['DateTime3'];
        _timeDifference1 = result.first['TimeDifference1'];
        _timeDifference2 = result.first['TimeDifference2'];
      });
    }
  }

  Future<void> _updatePatientData() async {
    String updateQuery = "UPDATE Patient SET "
        "PatientName = '${_nameController.text}', "
        "Hospital = '${_hospitalController.text}', "
        "Age = ${_ageController.text}, "
        "Gender = '${_gender}', "
        "Weight = '${_weightController.text}', "
        "SystolicBloodPressure = '${_systolicBloodPressureController.text}', "
        "DiastolicBloodPressure = '${_diastolicBloodPressureController.text}', "
        "Sugar = '${_sugarController.text}', "
        "DateTime1 = '${_dateTimeController1.text}', "
        "DateTime2 = '${_dateTimeController2.text}', "
        "DateTime3 = '${_dateTimeController3.text}', "
        "TimeDifference1 = ${_timeDifference1}, "
        "TimeDifference2 = ${_timeDifference2} "
        "WHERE ID = ${widget.patientID}";

    await _databaseManager.updateDatabase(updateQuery);
    Navigator.pop(context);
    _loadPatientData();
  }

  void updateGender(String newGender) {
    setState(() {
      _gender = newGender;
    });
  }

  void calculateTimeDifference() {
    if (_dateTimeController1.text.isNotEmpty &&
        _dateTimeController2.text.isNotEmpty) {
      TimeOfDay time1 = _parseTime(_dateTimeController1.text);
      TimeOfDay time2 = _parseTime(_dateTimeController2.text);

      Duration difference1 = _getTimeDifference(time1, time2);

      setState(() {
        _timeDifference1 = difference1.inHours.toDouble() +
            (difference1.inMinutes.remainder(60) / 60);
      });
    } else {
      setState(() {
        _timeDifference1 = 0.0;
      });
    }

    if (_dateTimeController2.text.isNotEmpty &&
        _dateTimeController3.text.isNotEmpty) {
      TimeOfDay time2 = _parseTime(_dateTimeController2.text);
      TimeOfDay time3 = _parseTime(_dateTimeController3.text);

      Duration difference2 = _getTimeDifference(time2, time3);

      setState(() {
        _timeDifference2 = difference2.inHours.toDouble() +
            (difference2.inMinutes.remainder(60) / 60);
      });
    } else {
      setState(() {
        _timeDifference2 = 0.0;
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

    return Scaffold(
      backgroundColor: Color(0xFF82B1FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'เเก้ไขข้อมูลผู้ป่วย',
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
                        Image.asset('images/nihss.png',
                            width: width * 0.4, height: height * 0.21),
                        NameInput(nameController: _nameController),
                        HospitalInput(hospitalController: _hospitalController),
                        AgeInput(controller: _ageController),
                        GenderSelection(onGenderSelected: updateGender),
                        WeightInput(controller: _weightController),
                        BloodInput(
                          systolicController: _systolicBloodPressureController,
                          diastolicController:
                              _diastolicBloodPressureController,
                        ),
                        SugarInput(controller: _sugarController),
                        DatetimeSelection1(
                          controller: _dateTimeController1,
                          onDateChanged: _onDateTimeChanged,
                        ),
                        DatetimeSelection2(
                          controller: _dateTimeController2,
                          onDateChanged: _onDateTimeChanged,
                        ),
                        DatetimeSelection3(
                          controller: _dateTimeController3,
                          onDateChanged: _onDateTimeChanged,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.03),
                          child: Text(
                            'ระยะเวลาที่มีอาการถึงโรงพยาบาล: ${_timeDifference1.toStringAsFixed(2)} ชั่วโมง',
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.03),
                          child: Text(
                            'ระยะเวลาอีกครั้ง: ${_timeDifference2.toStringAsFixed(2)} ชั่วโมง',
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.03, bottom: height * 0.03),
                          child: ElevatedButton(
                            onPressed: () {
                              calculateTimeDifference();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditPatient2(
                                    patientID: widget.patientID,
                                    nameController: _nameController,
                                    hospitalController: _hospitalController,
                                    ageController: _ageController,
                                    gender: _gender,
                                    weightController: _weightController,
                                    systolicBloodPressureController:
                                        _systolicBloodPressureController,
                                    diastolicBloodPressureController:
                                        _diastolicBloodPressureController,
                                    sugarController: _sugarController,
                                    dateTimeController1: _dateTimeController1,
                                    dateTimeController2: _dateTimeController2,
                                    dateTimeController3: _dateTimeController3,
                                    timeDifference1: _timeDifference1,
                                    timeDifference2: _timeDifference2,
                                  ),
                                ),
                              );
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
                              textAlign: TextAlign.center,
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
