import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_app/Edit_Patient/EditNihss1.dart';
import 'package:hospital_app/Edit_Patient/EditNihss10.dart';
import 'package:hospital_app/Edit_Patient/EditNihss11.dart';
import 'package:hospital_app/Edit_Patient/EditNihss12.dart';
import 'package:hospital_app/Edit_Patient/EditNihss13.dart';
import 'package:hospital_app/Edit_Patient/EditNihss14.dart';
import 'package:hospital_app/Edit_Patient/EditNihss15.dart';
import 'package:hospital_app/Edit_Patient/EditNihss2.dart';
import 'package:hospital_app/Edit_Patient/EditNihss3.dart';
import 'package:hospital_app/Edit_Patient/EditNihss4.dart';
import 'package:hospital_app/Edit_Patient/EditNihss5.dart';
import 'package:hospital_app/Edit_Patient/EditNihss6.dart';
import 'package:hospital_app/Edit_Patient/EditNihss7.dart';
import 'package:hospital_app/Edit_Patient/EditNihss8.dart';
import 'package:hospital_app/Edit_Patient/EditNihss9.dart';
import 'package:hospital_app/sql_lite.dart';

class NihssDetail extends StatefulWidget {
  final int patientID;

  const NihssDetail({Key? key, required this.patientID}) : super(key: key);

  @override
  State<NihssDetail> createState() => _NihssDetailState();
}

class _NihssDetailState extends State<NihssDetail> {
  Map<String, dynamic>? patient;
  final SqllLiteManage _databaseManager = SqllLiteManage();
  int _totalScore = 0;

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
        patient = result.first;
        _totalScore = result.first['TotalScore'];
      });
    }
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
            'NIHSS',
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
          children: [
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
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
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'NIHSS ${patient?['TotalScore']} คะเเนน',
                            style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                              color: _totalScore == 0
                                  ? Colors.green
                                  : (_totalScore >= 1 && _totalScore <= 4)
                                      ? Colors.yellow[600]
                                      : (_totalScore >= 5 && _totalScore <= 15)
                                          ? Colors.orange
                                          : (_totalScore >= 16 &&
                                                  _totalScore <= 20)
                                              ? Colors.amber[900]
                                              : (_totalScore >= 21)
                                                  ? Colors.red
                                                  : Colors.black,
                            ),
                          ),
                          Text(
                            '${patient?['NIHSSLevel']}',
                            style: TextStyle(
                              fontSize: height * 0.022,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'คำตอบ',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'คะเเนน',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss1(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                              height,
                              width,
                              'ข้อที่ 1a',
                              '${patient?['SelectedText1']}',
                              '${patient?['SelectedScore1']}',
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss2(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 1b',
                                '${patient?['SelectedText2']}',
                                '${patient?['SelectedScore2']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss3(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 1c',
                                '${patient?['SelectedText3']}',
                                '${patient?['SelectedScore3']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss4(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 2 ',
                                '${patient?['SelectedText4']}',
                                '${patient?['SelectedScore4']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss5(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 3 ',
                                '${patient?['SelectedText5']}',
                                '${patient?['SelectedScore5']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss6(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 4 ',
                                '${patient?['SelectedText6']}',
                                '${patient?['SelectedScore6']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss7(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 5a',
                                '${patient?['SelectedText7']}',
                                '${patient?['SelectedScore7']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss8(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 5b',
                                '${patient?['SelectedText8']}',
                                '${patient?['SelectedScore8']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss9(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 6a',
                                '${patient?['SelectedText9']}',
                                '${patient?['SelectedScore9']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss10(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 6b',
                                '${patient?['SelectedText10']}',
                                '${patient?['SelectedScore10']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss11(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 7 ',
                                '${patient?['SelectedText11']}',
                                '${patient?['SelectedScore11']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss12(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 8 ',
                                '${patient?['SelectedText12']}',
                                '${patient?['SelectedScore12']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss13(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 9 ',
                                '${patient?['SelectedText13']}',
                                '${patient?['SelectedScore13']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss14(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 10',
                                '${patient?['SelectedText14']}',
                                '${patient?['SelectedScore14']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNihss15(
                                    patientID: widget.patientID,
                                  ),
                                ),
                              ).then((_) {
                                _loadPatientData();
                              });
                            },
                            child: buildRow(
                                height,
                                width,
                                'ข้อที่ 11',
                                '${patient?['SelectedText15']}',
                                '${patient?['SelectedScore15']}'),
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          SizedBox(height: height * 0.01),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}

Widget buildRow(
    double height, double width, String label, String text, String score) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height * 0.01),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            '$label $text',
            style: TextStyle(
              fontSize: height * 0.018,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: width * 0.05),
        Text(
          score,
          style: TextStyle(
            fontSize: height * 0.018,
          ),
        ),
      ],
    ),
  );
}
