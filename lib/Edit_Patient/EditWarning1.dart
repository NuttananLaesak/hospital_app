import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app/Edit_Patient/EditWarning2.dart';
import 'package:hospital_app/Indications/Indications1.dart';
import 'package:hospital_app/Indications/Indications2.dart';
import 'package:hospital_app/Indications/Indications3.dart';
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
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditWarning1 extends StatefulWidget {
  final int patientId;

  const EditWarning1({Key? key, required this.patientId}) : super(key: key);

  @override
  State<EditWarning1> createState() => _EditWarning1State();
}

class _EditWarning1State extends State<EditWarning1> {
  late bool ageMore;
  late bool ageLess;
  int indications1 = -1;
  late bool hourLess;
  late bool hourMore;
  int indications2 = -1;
  int indications3 = -1;
  int strictlyprohibited1 = -1;
  int strictlyprohibited2 = -1;
  int strictlyprohibited3 = -1;
  int strictlyprohibited4 = -1;
  int strictlyprohibited5 = -1;
  int strictlyprohibited6 = -1;
  late bool bloodLess;
  late bool bloodMore;
  int strictlyprohibited7 = -1;
  int strictlyprohibited8 = -1;
  int strictlyprohibited9 = -1;
  late bool sugarLess;
  late bool sugarMore;
  int strictlyprohibited10 = -1;
  late bool ctLess;
  late bool ctMore;
  int strictlyprohibited11 = -1;
  double _timeDifference1 = 0;
  int _age = 0;
  int _sblood = 0;
  int _dblood = 0;
  int _sugar = 0;
  int _ctBrain = -1;
  int strictlyprohibited12 = -1;
  int strictlyprohibited13 = -1;
  int strictlyprohibited14 = -1;

// ignore: unused_field
  Patient? _patient;

  @override
  void initState() {
    super.initState();
    loadPatientData();

    if (_timeDifference1 == 0) {
      indications1 = -1;
      hourLess = false;
      hourMore = false;
    } else {
      hourLess = _timeDifference1 <= 4.5;
      hourMore = _timeDifference1 >= 4.6;
      indications1 = hourLess ? 1 : 0;
    }
    if (_age == 0) {
      indications2 = -1;
      ageLess = false;
      ageMore = false;
    } else {
      ageMore = _age >= 18;
      ageLess = _age < 18;
      indications2 = ageMore ? 1 : 0;
    }

    if (_sblood == 0 || _dblood == 0) {
      strictlyprohibited7 = -1;
      bloodLess = false;
      bloodMore = false;
    } else {
      bloodLess = _sblood <= 184 && _dblood <= 109;
      bloodMore = _sblood >= 185 || _dblood >= 110;
      strictlyprohibited7 = bloodLess ? 1 : 0;
    }

    if (_sugar == 0) {
      strictlyprohibited10 = -1;
      sugarLess = false;
      sugarMore = false;
    } else {
      sugarMore = _sugar >= 51;
      sugarLess = _sugar <= 50;
      strictlyprohibited10 = sugarMore ? 1 : 0;
    }

    if (_ctBrain == -1) {
      strictlyprohibited11 = -1;
      ctLess = false;
      ctMore = false;
    } else {
      ctLess = _ctBrain <= 2;
      ctMore = _ctBrain == 3;
      strictlyprohibited11 = ctLess ? 1 : 0;
    }
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

          _timeDifference1 = patient.timeDifference1 ?? 0.0;
          _age = patient.ageController ?? 0;
          try {
            _sblood = int.parse(patient.systolicBloodPressureController);
          } catch (e) {
            _sblood = 0;
          }
          try {
            _dblood = int.parse(patient.diastolicBloodPressureController);
          } catch (e) {
            _dblood = 0;
          }
          try {
            _sugar = int.parse(patient.sugarController);
          } catch (e) {
            _sugar = 0;
          }
          _ctBrain = patient.ctBrain ?? -1;
        });
        break;
      }
    }
  }

  void updateIndications1(bool? value, bool isHourLess) {
    setState(() {
      if (isHourLess) {
        hourLess = value ?? false;
        hourMore = !hourLess;
      } else {
        hourMore = value ?? false;
        hourLess = !hourMore;
      }
      indications1 = hourLess ? 1 : 0;
    });
  }

  void updateIndications2(bool? value, bool isAgeMore) {
    setState(() {
      if (isAgeMore) {
        ageMore = value ?? false;
        ageLess = !ageMore;
      } else {
        ageLess = value ?? false;
        ageMore = !ageLess;
      }
      indications2 = ageMore ? 1 : 0;
    });
  }

  void updateStrictlyProhibited7(bool? value, bool isBloodLess) {
    setState(() {
      if (isBloodLess) {
        bloodLess = value ?? false;
        bloodMore = !bloodLess;
      } else {
        bloodMore = value ?? false;
        bloodLess = !bloodMore;
      }
      strictlyprohibited7 = bloodLess ? 1 : 0;
    });
  }

  void updateStrictlyProhibited10(bool? value, bool isSugarMore) {
    setState(() {
      if (isSugarMore) {
        sugarMore = value ?? false;
        sugarLess = !sugarMore;
      } else {
        sugarLess = value ?? false;
        sugarMore = !sugarLess;
      }
      strictlyprohibited10 = sugarMore ? 1 : 0;
    });
  }

  void updateStrictlyProhibited11(bool? value, bool isCtMore) {
    setState(() {
      if (isCtMore) {
        ctLess = value ?? false;
        ctMore = !ctLess;
      } else {
        ctMore = value ?? false;
        ctLess = !ctMore;
      }
      strictlyprohibited11 = ctLess ? 1 : 0;
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
                          ageMore: ageMore,
                          ageLess: ageLess,
                          ageMoreChanged: (value) =>
                              updateIndications2(value, true),
                          AgeLessChanged: (value) =>
                              updateIndications2(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Indications1(
                          hourLess: hourLess,
                          hourMore: hourMore,
                          hourLessChanged: (value) =>
                              updateIndications1(value, true),
                          hourMoreChanged: (value) =>
                              updateIndications1(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Indictions3(
                          onChanged: (value) {
                            setState(() {
                              indications3 = value;
                            });
                          },
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
                          bloodLess: bloodLess,
                          bloodMore: bloodMore,
                          bloodLessChanged: (value) =>
                              updateStrictlyProhibited7(value, true),
                          bloodMoreChanged: (value) =>
                              updateStrictlyProhibited7(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited3(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited3 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited4(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited4 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited1(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited1 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited9(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited9 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited12(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited12 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited13(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited13 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited14(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited14 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited11(
                          ctLess: ctLess,
                          ctMore: ctMore,
                          ctLessChanged: (value) =>
                              updateStrictlyProhibited11(value, true),
                          ctMoreChanged: (value) =>
                              updateStrictlyProhibited11(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited10(
                          sugarLess: sugarLess,
                          sugarMore: sugarMore,
                          sugarMoreChanged: (value) =>
                              updateStrictlyProhibited10(value, true),
                          sugarLessChanged: (value) =>
                              updateStrictlyProhibited10(value, false),
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited6(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited6 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited8(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited8 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited2(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited2 = value;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Strictly_Prohibited5(
                          onChanged: (value) {
                            setState(() {
                              strictlyprohibited5 = value;
                            });
                          },
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
                        builder: (context) => EditWarning2(
                          patientId: widget.patientId,
                          indications1: indications1,
                          indications2: indications2,
                          indications3: indications3,
                          strictlyprohibited1: strictlyprohibited1,
                          strictlyprohibited2: strictlyprohibited2,
                          strictlyprohibited3: strictlyprohibited3,
                          strictlyprohibited4: strictlyprohibited4,
                          strictlyprohibited5: strictlyprohibited5,
                          strictlyprohibited6: strictlyprohibited6,
                          strictlyprohibited7: strictlyprohibited7,
                          strictlyprohibited8: strictlyprohibited8,
                          strictlyprohibited9: strictlyprohibited9,
                          strictlyprohibited10: strictlyprohibited10,
                          strictlyprohibited11: strictlyprohibited11,
                          strictlyprohibited12: strictlyprohibited12,
                          strictlyprohibited13: strictlyprohibited13,
                          strictlyprohibited14: strictlyprohibited14,
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
